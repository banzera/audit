require 'rake/clean'

CLOBBER.include %w[
  db/legacy/ddl/load_data.sql
  db/legacy/ddl/schema.sql
  db/legacy/create_system_dsn.bat
]

class LegacyDb

  def self.db
    ENV['DATABASE_URL'] || "-d #{RANDOM_DB_NAME}"
  end

  def self.mdb
    ENV['MDB'] || 'db/legacy/audit.accdb'
  end

  def self.tables
    [
     "tblSupplier",
     "tblSKU",
     "tblPurchaseOrder",
     "tblAnalysis",
     "tblAnalysisItems",
     "tblBank",
     "tblCategory",
     "tblCustomer",
     "tblDCLocUpdate",
     "tblOrder",
     "tblOrderDeposit",
     "tblOrderItems",
     "tblOrderPmts",
     "tblOrderPmtsItems",
     "tblPercent",
     "tblPreOrder",
     "tblPreOrderCodes",
     "tblPreOrderItems",
     "tblPurchaseOrderItems",
     "tblPurchaseType",
     "tblSKUClass",
     "tblSKUCustInfo",
     "tblShipper",
     "tblSupplierPmts",
     "tblSupplierPmtsItems",
     "tblTaxJurisdiction",
     "tblUpdateNA",
     "tblVendor",
   ]
  end

  def self.parse_database_url
    uri = URI(ENV['DATABASE_URL'].lstrip.chomp)

    {
      user:     uri.user,
      pass:     uri.password,
      port:     uri.port || 5432,
      host:     uri.host,
      database: uri.path[1..],
      sslmode:  "prefer",
    }
  end
end

DUMP_FILES = Rake::FileList.new do |fl|
  fl.include LegacyDb.tables.map { |t| "db/legacy/dumps/#{t}.csv" }
end

namespace :heroku do
  desc "Reset the remote database and push a named local database"
  task :rebuild, [:db_name]  do |t, args|
    db_name = args[:db_name] ||     `heroku pg:reset`

    next unless $?.success?

    `heroku pg:push #{db_name} DATABASE`
  end
end

namespace :db do
  desc "Print active DB URL components"
  task :details do
    puts LegacyDb.parse_database_url
  end

  desc "List active DB tables"
  task :list_tables do
    puts "Listing defined relations in #{LegacyDb.db}"
    cmd = %Q|psql -c '\\d' #{LegacyDb.db}|
    puts `#{cmd}`
  end

  desc "Bootstrap a local PostgreSQL DB"
  task :bootstrap => %w[
                        drop
                        create
                        ddl:data
                        load:schema
                        load:data
                      ]

  desc "Refresh the data in the database"
  task :refresh => %w[reset_schema load:schema load:data db:migrate db:seed]

  task :reset_schema => :environment do
    SCHEMA_NAME = 'public'.freeze
    puts "Dropping schema #{SCHEMA_NAME} on #{LegacyDb.parse_database_url[:database]}"
    ActiveRecord::Base.connection.drop_schema SCHEMA_NAME
    puts "Creating schema #{SCHEMA_NAME} on #{LegacyDb.parse_database_url[:database]}"
    ActiveRecord::Base.connection.create_schema SCHEMA_NAME
  end

  namespace :load do
    desc "Load the schema DDL into a named database"
    task :schema do |t, args|
      puts "Loading schema"
      `psql #{LegacyDb.db} < db/legacy/ddl/au-audit.sql`
      `psql #{LegacyDb.db} < db/legacy/ddl/sequences.sql`
      `psql #{LegacyDb.db} < db/legacy/ddl/views.sql`
    end

    desc "Load the prepared dataset into a named database"
    task :data => %w[ddl:data] do |t, args|
      puts "Loading data"
      `psql #{LegacyDb.db} < db/legacy/ddl/load_data.sql`

      puts "Reseting sequences"
      `psql #{LegacyDb.db} < db/legacy/ddl/reset_sequences.sql`

      puts "Creating indexes/foreign keys"
      `psql #{LegacyDb.db} < db/legacy/ddl/indexes.sql`
      `psql #{LegacyDb.db} < db/legacy/ddl/foreign_keys.sql`
      `psql #{LegacyDb.db} < db/legacy/ddl/triggers.sql`
    end
  end
end

namespace :mdb do
  desc "Fetch latest Access DB"
  task :fetch => LegacyDb.mdb
  file LegacyDb.mdb do |t|
    require "down"
    uri = ENV['ACCDB_URL']
    puts "Fetching Access DB from #{uri}"
    Down.download uri, destination: t.name
  end
  CLEAN.include LegacyDb.mdb

  namespace :dump do
    desc "Dump data from Access DB"
    task :all => [LegacyDb.mdb, 'schema'] do
      puts "Dumping data from #{LegacyDb.mdb}"
      LegacyDb.tables.each do |t|
        puts t
        `mdb-export -H \
                    -D '%F' \
                    -T '%F %T' \
                    #{LegacyDb.mdb} #{t} 1> db/legacy/dumps/#{t}.csv`
      end
    end

    desc "Dump schema from Access DB"
    task :schema => 'db/legacy/ddl/schema.sql'
    file 'db/legacy/ddl/schema.sql' => LegacyDb.mdb do |t|
      puts "Dumping schema from #{LegacyDb.mdb}"

      `mdb-schema          \
          --indexes        \
          --comments       \
          --default-values \
          --not-null       \
          #{LegacyDb.mdb} postgres 2> /dev/null \
                                   1> #{t.name}
        `
    end
  end
end

desc "Sanitize the CSV dump files from Access"
task :sanitize => DUMP_FILES.ext(".clean-csv")

rule ".csv" => LegacyDb.mdb do |t|
  puts "Dumping data in #{LegacyDb.mdb} from #{t.name}"
  table_name = t.name.pathmap('%n')
  `mdb-export -H -D '%F' -T '%F %T' #{LegacyDb.mdb} #{table_name} 1> #{t.name} 2> /dev/null`
end
CLEAN.include 'db/legacy/dumps/*.csv'

rule ".clean-csv" => ".csv" do |t|
  puts "Cleaning #{t.source}"
  `sed -E -e 's/\"1900-01-00 00:00:00\"/\"1900-01-01 00:00:00\"/g' #{t.source} > #{t.name}`
end
CLEAN.include 'db/legacy/dumps/*.clean-csv'

namespace :ddl do
  desc "Create the DDL for loading the data"
  task :data => %w[db/legacy/ddl/load_data.sql]
  file 'db/legacy/ddl/load_data.sql' => DUMP_FILES.ext(".clean-csv") do |t|
    puts "Generating the data import DDL"
    names = Hash[t.sources.map { |s|
      [s.gsub(/db\/legacy\/dumps\/|.clean-csv/,'') , "'#{s}'"]
    } ]

    puts "No dump files to process" and next unless names.any?

    j1 = names.keys.map(&:length).max + 1
    j2 = names.values.map(&:length).max + 1

    File.open(t.name, 'w') do |f|
      names.each do |table_name, quoted_src|
        f.puts "\\copy #{table_name.ljust(j1)} from #{quoted_src.ljust(j2)} with csv"
      end
    end
  end

  desc "Create the DDL for the indexes"
  task :indexes => 'ddl/indexes.sql'
  file "ddl/indexes.sql" => "indexes.yaml" do |t|
    defs = YAML::load_file t.source

    File.open(t.name, 'w') do |f|
      defs&.each do |table, index_defs|
        f.puts "-- Indexes for #{table}"

        index_defs&.each do |id, attrs|

          unless "PrimaryKey" == id || attrs["Foreign"]
            field_list    = attrs["Fields"].map(&:keys).flatten
            # quoted_fields = field_list.map {|f| %Q{"#{f}"} }
            unique = attrs["Unique"] ? 'UNIQUE' : ''

            f.puts %Q|  CREATE #{unique} INDEX index_#{table}_on_#{field_list.join('_')} ON #{table} (#{field_list.join(',')}); |
          end
        end
      end
    end
  end
end

desc "Create a batch file to install a system DSN for the Heroku DB"
task :odbcconf => "create_system_dsn.bat"
file "create_system_dsn.bat" do |t|
  dsn = ENV.fetch('DSN_NAME', 'heroku_audit-pg')

  puts "Getting credentials from Heroku..."
  url = `heroku pg:credentials:url | grep postgres`

  uri = URI(url.lstrip.chomp)

  dsn_parts = [
    "DSN=#{dsn}",
    "UID=#{uri.user}",
    "PWD=#{uri.password}",
    "PORT=#{uri.port || 5432}",
    "SERVER=#{uri.host}",
    "DATABASE=#{uri.path[1..]}",
    "SSLMODE=prefer",
  ]

  puts "Writing file #{t.name}"
  File.open(t.name, 'w') do |f|
    f.puts %Q{odbcconf CONFIGSYSDSN "PostgreSQL Unicode(x64)" "#{dsn_parts.join('|')}"}
  end
end
