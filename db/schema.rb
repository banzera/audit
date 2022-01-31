# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_28_135252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "addressable_type"
    t.integer "addressable_id"
    t.string "category", limit: 64
    t.string "full_name"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "city"
    t.string "state_code"
    t.string "country_code"
    t.string "postal_code"
    t.string "phone_pri"
    t.string "phone_alt"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["addressable_id"], name: "index_addresses_on_addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "clinic_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "contacts", force: :cascade do |t|
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "inventory_scan_operations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sku_id"
    t.string "dc_loc"
    t.datetime "scanned_at"
    t.datetime "received_at"
    t.jsonb "payload"
    t.jsonb "request"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "user_type"
    t.integer "user_id"
    t.string "changes_to_type"
    t.integer "changes_to_id"
    t.string "associated_type"
    t.integer "associated_id"
    t.string "associated_to_s"
    t.integer "logs_count"
    t.text "message"
    t.text "details"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["associated_id"], name: "index_logs_on_associated_id"
    t.index ["associated_to_s"], name: "index_logs_on_associated_to_s"
    t.index ["associated_type", "associated_id"], name: "index_logs_on_associated_type_and_associated_id"
    t.index ["parent_id"], name: "index_logs_on_parent_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.string "office_name"
    t.integer "clinic_type_id"
    t.string "status"
    t.integer "assigned_to_id"
    t.string "contact_phone"
    t.string "alt_phone"
    t.text "doctors_names"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "primary_contact"
  end

  create_table "tblanalysis", primary_key: "analysisid", id: :integer, default: -> { "nextval('tblanalysis_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "customerid"
    t.datetime "analysisdate"
    t.datetime "startanalysisdate"
    t.datetime "endanalysisdate"
    t.integer "analysissplrid"
    t.index ["analysissplrid"], name: "index_tblanalysis_on_analysissplrid"
    t.index ["customerid"], name: "index_tblanalysis_on_customerid"
  end

  create_table "tblanalysisitems", primary_key: "analysisitemsid", id: :integer, default: -> { "nextval('tblanalysisitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "skuid"
    t.datetime "aorderdate"
    t.integer "aorderquant"
    t.float "aorderpriceper"
    t.integer "customerid"
    t.integer "splrid"
    t.string "vsku", limit: 255
    t.integer "splrid2"
    t.integer "analysisid"
    t.index ["customerid"], name: "index_tblanalysisitems_on_customerid"
    t.index ["skuid"], name: "index_tblanalysisitems_on_skuid"
    t.index ["splrid"], name: "index_tblanalysisitems_on_splrid"
  end

  create_table "tblbank", primary_key: "bankid", id: :integer, default: -> { "nextval('tblbank_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "bankname", limit: 255
    t.string "bankbusinessname", limit: 255
    t.string "bankfirst", limit: 255
    t.string "banklast", limit: 255
    t.string "banksal", limit: 255
    t.string "banktitle", limit: 255
    t.string "bankaddress", limit: 255
    t.string "bankcity", limit: 255
    t.string "bankst", limit: 255
    t.string "bankzip", limit: 255
    t.string "bankphone", limit: 255
    t.string "bankfax", limit: 255
    t.string "bankemail", limit: 255
    t.string "bankprimarycontact1", limit: 255
    t.string "bankphone1", limit: 255
    t.string "bankphonetype1", limit: 255
    t.string "bankemail1", limit: 255
    t.string "bankprimarycontact2", limit: 255
    t.string "bankphone2", limit: 255
    t.string "bankphonetype2", limit: 255
    t.string "bankemail2", limit: 255
    t.string "bankacctno", limit: 255
    t.string "bankacctname", limit: 255
    t.text "banknotes"
    t.datetime "bankdatemodified"
    t.index ["bankname"], name: "index_tblbank_on_bankname"
  end

  create_table "tblcategory", primary_key: "categoryid", id: :integer, default: -> { "nextval('tblcategory_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "categorydesc", limit: 255
  end

  create_table "tblcustomer", primary_key: "custid", id: :integer, default: -> { "nextval('tblcustomer_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "custname", limit: 255
    t.string "custbusinessname", limit: 255
    t.string "custfirst", limit: 255
    t.string "custlast", limit: 255
    t.string "custsal", limit: 255
    t.string "custtitle", limit: 255
    t.string "custaddress", limit: 255
    t.string "custcity", limit: 255
    t.string "custst", limit: 255
    t.string "custzip", limit: 255
    t.string "custphone", limit: 255
    t.string "custfax", limit: 255
    t.string "custemail", limit: 255
    t.string "custprimarycontact1", limit: 255
    t.string "custphone1", limit: 255
    t.string "custphonetype1", limit: 255
    t.string "custemail1", limit: 255
    t.string "custprimarycontact2", limit: 255
    t.string "custphone2", limit: 255
    t.string "custphonetype2", limit: 255
    t.string "custemail2", limit: 255
    t.float "custtaxrate"
    t.text "custnotes"
    t.datetime "custdatecreated"
    t.datetime "custdatemodified"
    t.string "custbillingbusinessname", limit: 255
    t.string "custbillingfirst", limit: 255
    t.string "custbillinglast", limit: 255
    t.string "custbillingsal", limit: 255
    t.string "custbillingtitle", limit: 255
    t.string "custbillingaddress", limit: 255
    t.string "custbillingcity", limit: 255
    t.string "custbillingst", limit: 255
    t.string "custbillingzip", limit: 255
    t.string "custbillingphone", limit: 255
    t.string "custbillingfax", limit: 255
    t.string "custbillingemail", limit: 255
    t.boolean "custbillingsame"
    t.boolean "custqbo"
    t.boolean "custccauth"
    t.string "custcclast4", limit: 255
    t.integer "custtaxjurisid"
    t.datetime "lastrewarddate"
    t.string "custhsacct", limit: 255
    t.boolean "discontinued"
    t.string "custtyfirstname", limit: 255
    t.string "custtylastname", limit: 255
    t.string "custtyaddress", limit: 255
    t.string "custtycity", limit: 255
    t.string "custtyst", limit: 255
    t.string "custtyzip", limit: 255
    t.string "custtyphone", limit: 255
    t.string "custtyemail", limit: 255
    t.index ["custname"], name: "index_tblcustomer_on_custname"
    t.index ["custtaxjurisid"], name: "index_tblcustomer_on_custtaxjurisid"
  end

  create_table "tbldclocupdate", primary_key: "dclocupdateid", id: :integer, default: -> { "nextval('tbldclocupdate_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "username", limit: 255
    t.integer "skuid"
    t.string "timestampscanned", limit: 255
    t.string "timestamprcvd", limit: 255
    t.string "dcloc", limit: 255
    t.index ["skuid"], name: "index_tbldclocupdate_on_skuid"
  end

  create_table "tblorder", primary_key: "orderid", id: :integer, default: -> { "nextval('tblorder_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "orderdate"
    t.string "orderbatch", limit: 255
    t.integer "custid"
    t.float "ordertaxrate"
    t.datetime "orderdelivereddate"
    t.string "orderdeliverdfrom", limit: 255
    t.string "orderdeliveredto", limit: 255
    t.string "ordershipmethod", limit: 255
    t.string "orderreceipthl", limit: 255
    t.datetime "orderdateinvoiced"
    t.datetime "orderdatepaid"
    t.string "orderpaymentmethod", limit: 255
    t.float "orderpaymentamount", default: 0.0
    t.text "ordernotes"
    t.datetime "orderccdate"
    t.datetime "preordercompletedate"
    t.datetime "orderconfirmdate"
    t.index ["custid"], name: "index_tblorder_on_custid"
    t.index ["orderbatch"], name: "index_tblorder_on_orderbatch"
    t.index ["orderdateinvoiced"], name: "index_tblorder_on_orderdateinvoiced"
    t.index ["orderdatepaid"], name: "index_tblorder_on_orderdatepaid"
  end

  create_table "tblorderdeposit", primary_key: "odepositid", id: :integer, default: -> { "nextval('tblorderdeposit_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "odepositdate"
    t.string "odepositbatch", limit: 255
    t.index ["odepositbatch"], name: "index_tblorderdeposit_on_odepositbatch"
  end

  create_table "tblorderitems", primary_key: "orderitemsid", id: :integer, default: -> { "nextval('tblorderitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "skuid"
    t.integer "poid"
    t.integer "orderid"
    t.integer "orderquant", default: 0
    t.float "orderpriceper", default: 0.0
    t.float "orderpricetotal", default: 0.0
    t.float "ordertaxrate"
    t.float "ordertaxtotal", default: 0.0
    t.float "orderdeliverycosttotal", default: 0.0
    t.float "orderfeestotal", default: 0.0
    t.float "ordergrandtotal", default: 0.0
    t.datetime "orderitemsdelivereddate"
    t.integer "orderdeliveredquant", default: 0
    t.float "orderretailtotal", default: 0.0
    t.boolean "orderitemsurgent", default: false, null: false
    t.index ["orderid"], name: "index_tblorderitems_on_orderid"
    t.index ["poid"], name: "index_tblorderitems_on_poid"
    t.index ["skuid"], name: "index_tblorderitems_on_skuid"
  end

  create_table "tblorderpmts", primary_key: "opmtsid", id: :integer, default: -> { "nextval('tblorderpmts_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "opmtsdate"
    t.string "opmtsbatch", limit: 255
    t.index ["opmtsbatch"], name: "index_tblorderpmts_on_pobatch"
  end

  create_table "tblorderpmtsitems", primary_key: "opmtsitemsid", id: :integer, default: -> { "nextval('tblorderpmtsitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "opmtsid"
    t.integer "orderitemsid"
    t.float "opmtstotal"
    t.integer "odepositid"
    t.index ["opmtsid"], name: "index_tblorderpmtsitems_on_opmtsid"
    t.index ["orderitemsid"], name: "index_tblorderpmtsitems_on_orderitemsid"
  end

  create_table "tblpercent", primary_key: "percent", id: :float, force: :cascade do |t|
  end

  create_table "tblpreorder", primary_key: "preorderid", id: :integer, default: -> { "nextval('tblpreorder_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "preorderdate"
    t.string "preorderbatch", limit: 255
    t.integer "custid"
    t.text "preordernotes"
    t.float "preordersh1"
    t.float "preordersh2"
    t.integer "preordervendorid"
    t.integer "orderid"
    t.datetime "ordercreatedate"
    t.datetime "preorderanalysisdate"
    t.datetime "confirmationdate"
    t.datetime "preordercheck"
    t.integer "splrid"
    t.decimal "ds_tax_amount"
    t.index ["custid"], name: "index_tblpreorder_on_custid"
    t.index ["preorderbatch"], name: "index_tblpreorder_on_preorderbatch"
    t.index ["preordervendorid"], name: "index_tblpreorder_on_preordervendorid"
    t.index ["splrid"], name: "index_tblpreorder_on_splrid"
  end

  create_table "tblpreordercodes", primary_key: "preordercodeid", id: :integer, default: -> { "nextval('tblpreordercodes_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "preordercode", limit: 255
    t.string "preordercodedesc", limit: 255
    t.index ["preordercode"], name: "index_tblpreordercodes_on_preordercode"
  end

  create_table "tblpreorderitems", primary_key: "preorderitemsid", id: :integer, default: -> { "nextval('tblpreorderitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "preorderid"
    t.integer "poid"
    t.integer "skuid1"
    t.integer "skuid2"
    t.integer "orderquant1"
    t.integer "orderquant2"
    t.float "orderpriceper1"
    t.float "orderpriceper2"
    t.float "orderpricetotal1"
    t.float "orderpricetotal2"
    t.float "orderaupriceper"
    t.integer "preorderitemcode"
    t.datetime "orderdate"
    t.text "preordernotes"
    t.boolean "preorderurgent", default: false, null: false
    t.index ["preorderitemcode"], name: "index_tblpreorderitems_on_preorderitemcode"
  end

  create_table "tblpurchaseorder", primary_key: "poid", id: :integer, default: -> { "nextval('tblpurchaseorder_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "podate"
    t.string "pobatch", limit: 255
    t.integer "splrid"
    t.integer "splrid2"
    t.datetime "poshipdate"
    t.string "poshiptype", limit: 255
    t.string "potrackingno", limit: 255
    t.string "porcvdby", limit: 255
    t.datetime "podatepaid"
    t.string "pomethodpaid", limit: 255
    t.string "popaymentno", limit: 255
    t.float "poamountpaid", default: 0.0
    t.text "ponotes"
    t.string "posplrorderno", limit: 255
    t.datetime "pochecksentdate"
    t.decimal "invoice_tax"
    t.decimal "invoice_sh"
    t.decimal "invoice_subtotal"
    t.decimal "invoice_total"
    t.index ["poamountpaid"], name: "index_tblpurchaseorder_on_poamountpaid"
    t.index ["pobatch"], name: "index_tblpurchaseorder_on_pobatch", unique: true
    t.index ["podatepaid"], name: "index_tblpurchaseorder_on_podatepaid"
    t.index ["pomethodpaid"], name: "index_tblpurchaseorder_on_pomethodpaid"
    t.index ["splrid"], name: "index_tblpurchaseorder_on_splrid"
  end

  create_table "tblpurchaseorderitems", primary_key: "poitemsid", id: :integer, default: -> { "nextval('tblpurchaseorderitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "poid"
    t.integer "skuid"
    t.integer "poorderquant"
    t.float "poorderprice", default: 0.0
    t.float "poordertax", default: 0.0
    t.float "poordershipping", default: 0.0
    t.float "poorderfees", default: 0.0
    t.float "poordertotal", default: 0.0
    t.float "poorderpriceper", default: 0.0
    t.float "poordertaxper", default: 0.0
    t.float "poordershippingper", default: 0.0
    t.float "poorderfeesper", default: 0.0
    t.float "poordertotalper", default: 0.0
    t.datetime "poorderrcvddate"
    t.integer "poorderrcvdquant", default: 0
    t.datetime "poorderexpiration"
    t.datetime "poorderrebatedeadline"
    t.datetime "poorderrebatesubmitted"
    t.boolean "poorderrebate", default: false, null: false
    t.string "poorderrebatenotes", limit: 255
    t.boolean "poordersplit", default: false, null: false
    t.boolean "poorderissue", default: false, null: false
    t.index ["poid", "skuid"], name: "index_tblpurchaseorderitems_on_poid_and_skuid", unique: true
  end

  create_table "tblpurchasetype", primary_key: "purchasetypeid", id: :integer, default: -> { "nextval('tblpurchasetype_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "purchasetype", limit: 255
  end

  create_table "tblshipper", primary_key: "shipid", id: :integer, default: -> { "nextval('tblshipper_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "shipname", limit: 255
    t.string "shipfirst", limit: 255
    t.string "shiplast", limit: 255
    t.string "shipbusinessname", limit: 255
    t.string "shipaddress", limit: 255
    t.string "shipcity", limit: 255
    t.string "shipst", limit: 255
    t.string "shipzip", limit: 255
    t.string "shipphone1", limit: 255
    t.string "shipphone2", limit: 255
    t.string "shipfax", limit: 255
    t.string "shipemail1", limit: 255
    t.string "shipemail2", limit: 255
    t.string "shipprimarycontact1", limit: 255
    t.string "shipprimarycontact2", limit: 255
  end

  create_table "tblsku", primary_key: "skuid", id: :integer, default: -> { "nextval('tblsku_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "sku", limit: 255
    t.string "manf", limit: 255
    t.string "itemno", limit: 255
    t.string "skudesc", limit: 255
    t.string "unitweight", limit: 255
    t.integer "categoryid", default: 3
    t.integer "skuminunits"
    t.string "skuminunitstype", limit: 255
    t.string "dcloc", limit: 255, default: "N/A"
    t.integer "skuminpercs", default: 1
    t.integer "vno01"
    t.string "vsku01", limit: 255
    t.text "vhl01"
    t.integer "vno02"
    t.string "vsku02", limit: 255
    t.text "vhl02"
    t.integer "vno03"
    t.string "vsku03", limit: 255
    t.text "vhl03"
    t.integer "vno04"
    t.string "vsku04", limit: 255
    t.text "vhl04"
    t.integer "vno05"
    t.string "vsku05", limit: 255
    t.text "vhl05"
    t.integer "vno06"
    t.string "vsku06", limit: 255
    t.text "vhl06"
    t.integer "vno07"
    t.string "vsku07", limit: 255
    t.text "vhl07"
    t.integer "vno08"
    t.string "vsku08", limit: 255
    t.text "vhl08"
    t.integer "vno09"
    t.string "vsku09", limit: 255
    t.text "vhl09"
    t.integer "vno10"
    t.string "vsku10", limit: 255
    t.text "vhl10"
    t.float "skuhighprice"
    t.integer "skuhighpricevno"
    t.datetime "skuhighpricedate"
    t.integer "skuclassid"
    t.integer "skumaxtemp", default: 0
    t.integer "skumintemp", default: 0
    t.text "skunotes"
    t.tsvector "tsv"
    t.boolean "has_issue", default: false
    t.boolean "has_expiration_date", default: false
    t.index ["itemno"], name: "index_tblsku_on_itemno", unique: true
    t.index ["sku"], name: "index_tblsku_on_sku", unique: true
    t.index ["skuclassid"], name: "index_tblsku_on_skuclassid"
  end

  create_table "tblskuclass", primary_key: "skuclassid", id: :integer, default: -> { "nextval('tblskuclass_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "skuclassdesc", limit: 255
  end

  create_table "tblskucustinfo", primary_key: "skucustinfoid", id: :integer, default: -> { "nextval('tblskucustinfo_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "skuid"
    t.integer "custid"
    t.boolean "skuonly"
    t.boolean "skunever"
    t.datetime "skuonlydate"
    t.datetime "skuneverdate"
    t.text "skucustnotes"
    t.integer "par_level", default: 0
    t.string "location"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["custid", "skuid"], name: "index_tblskucustinfo_on_custid_and_skuid", unique: true
    t.index ["custid"], name: "index_tblskucustinfo_on_custid"
    t.index ["skuid"], name: "index_tblskucustinfo_on_skuid"
  end

  create_table "tblsupplier", primary_key: "splrid", id: :integer, default: -> { "nextval('tblsupplier_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "splrname", limit: 255
    t.string "splrfirst", limit: 255
    t.string "splrlast", limit: 255
    t.string "splrbusinessname", limit: 255
    t.string "splraddress", limit: 255
    t.string "splrcity", limit: 255
    t.string "splrst", limit: 255
    t.string "splrzip", limit: 255
    t.string "splrwebsite", limit: 255
    t.string "splremail", limit: 255
    t.string "splrphone", limit: 255
    t.string "splrfax", limit: 255
    t.string "splrprimarycontact1", limit: 255
    t.string "splrphone1", limit: 255
    t.string "splremail1", limit: 255
    t.string "splrprimarycontact2", limit: 255
    t.string "splrphone2", limit: 255
    t.string "splremail2", limit: 255
    t.string "splrtaxid", limit: 255
    t.boolean "splrqbo"
    t.text "splrnotes"
    t.index ["splrtaxid"], name: "index_tblsupplier_on_splrtaxid"
  end

  create_table "tblsupplierpmts", primary_key: "spmtid", id: :integer, default: -> { "nextval('tblsupplierpmts_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "spmtdate"
    t.string "spmtbatch", limit: 255
    t.index ["spmtbatch"], name: "index_tblsupplierpmts_on_spmtbatch", unique: true
  end

  create_table "tblsupplierpmtsitems", primary_key: "spmtsitemsid", id: :integer, default: -> { "nextval('tblsupplierpmtsitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "spmtsid"
    t.integer "poitemsid"
    t.float "spmtstotal"
    t.index ["poitemsid"], name: "index_tblsupplierpmtsitems_on_poitemsid"
  end

  create_table "tbltaxjurisdiction", primary_key: "tjid", id: :integer, default: -> { "nextval('tbltaxjurisdiction_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "jurisdictioncode", limit: 255
    t.string "jurisdictionname", limit: 255
    t.datetime "rateeffdate"
    t.float "taxrate"
    t.index ["jurisdictioncode"], name: "index_tbltaxjurisdiction_on_jurisdictioncode"
  end

  create_table "tblupdatena", primary_key: "skuid", id: :integer, default: -> { "nextval('tblupdatena_id_seq'::regclass)" }, force: :cascade do |t|
  end

  create_table "tblvendor", primary_key: "vendorid", id: :integer, default: -> { "nextval('tblvendor_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "vendorname", limit: 255
    t.string "vendorabbr", limit: 255
  end

  create_table "users", comment: "Contains all the user login/profile information", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "default_company_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin"
    t.boolean "active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["created_by_id"], name: "index_users_on_created_by_id"
    t.index ["default_company_id"], name: "index_users_on_default_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["updated_by_id"], name: "index_users_on_updated_by_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.text "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "tblorder", "tblcustomer", column: "custid", primary_key: "custid", name: "tblorder_custid_fkey"
  add_foreign_key "tblorderitems", "tblorder", column: "orderid", primary_key: "orderid", name: "tblorderitems_orderid_fkey"
  add_foreign_key "tblorderitems", "tblpurchaseorder", column: "poid", primary_key: "poid", name: "tblorderitems_poid_fkey"
  add_foreign_key "tblorderitems", "tblsku", column: "skuid", primary_key: "skuid", name: "tblorderitems_skuid_fkey"
  add_foreign_key "tblorderpmtsitems", "tblorderitems", column: "orderitemsid", primary_key: "orderitemsid", name: "tblorderpmtsitems_orderitemsid_fkey"
  add_foreign_key "tblorderpmtsitems", "tblorderpmts", column: "opmtsid", primary_key: "opmtsid", name: "tblorderpmtsitems_opmtsid_fkey"
  add_foreign_key "tblpreorder", "tblsupplier", column: "splrid", primary_key: "splrid"
  add_foreign_key "tblpreorderitems", "tblpurchaseorder", column: "poid", primary_key: "poid"
  add_foreign_key "tblpurchaseorder", "tblsupplier", column: "splrid", primary_key: "splrid", name: "tblpurchaseorder_splrid_fkey"
  add_foreign_key "tblpurchaseorderitems", "tblpurchaseorder", column: "poid", primary_key: "poid", name: "tblpurchaseorderitems_poid_fkey"
  add_foreign_key "tblpurchaseorderitems", "tblsku", column: "skuid", primary_key: "skuid", name: "tblpurchaseorderitems_skuid_fkey"
  add_foreign_key "tblskucustinfo", "tblcustomer", column: "custid", primary_key: "custid"
  add_foreign_key "tblskucustinfo", "tblsku", column: "skuid", primary_key: "skuid"
  add_foreign_key "tblsupplierpmtsitems", "tblpurchaseorderitems", column: "poitemsid", primary_key: "poitemsid", name: "tblsupplierpmtsitems_poitemsid_fkey"
  add_foreign_key "tblsupplierpmtsitems", "tblsupplierpmts", column: "spmtsid", primary_key: "spmtid", name: "tblsupplierpmtsitems_spmtsid_fkey"
  create_function :db_to_csv, sql_definition: <<-SQL
      CREATE OR REPLACE FUNCTION public.db_to_csv(path text)
       RETURNS void
       LANGUAGE plpgsql
      AS $function$
      declare
         tables RECORD;
         statement TEXT;
      begin
      FOR tables IN
         SELECT (table_schema || '.' || table_name) AS schema_table
         FROM information_schema.tables t INNER JOIN information_schema.schemata s
         ON s.schema_name = t.table_schema
         WHERE t.table_schema NOT IN ('pg_catalog', 'information_schema')
         AND t.table_type NOT IN ('VIEW')
         ORDER BY schema_table
      LOOP
         statement := 'COPY ' || tables.schema_table || ' TO ''' || path || '/' || tables.schema_table || '.csv' ||
                        ''' WITH(FORMAT CSV, FORCE_QUOTE *, DELIMITER '';'', HEADER)';
         EXECUTE statement;
      END LOOP;
      return;
      end;
      $function$
  SQL
  create_function :update_sku_tsvector, sql_definition: <<-SQL
      CREATE OR REPLACE FUNCTION public.update_sku_tsvector()
       RETURNS trigger
       LANGUAGE plpgsql
      AS $function$
      BEGIN
        new.tsv :=
          setweight(to_tsvector('pg_catalog.english', coalesce(new.skuid::text,           '')), 'A') ||
                    to_tsvector('pg_catalog.english', coalesce(new.manf::text,            '')) ||
          setweight(to_tsvector('pg_catalog.english', coalesce(new.itemno::text,          '')), 'B') ||
                    to_tsvector('pg_catalog.english', coalesce(new.skudesc::text,         '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku01::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku02::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku03::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku04::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku05::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku06::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku07::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku08::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku09::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.vsku10::text,          '')) ||
                    to_tsvector('pg_catalog.english', coalesce(new.skunotes::text,        ''))
          ;
        return new;
      END
      $function$
  SQL


  create_trigger :tsvectorupdate, sql_definition: <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON public.tblsku FOR EACH ROW EXECUTE FUNCTION update_sku_tsvector()
  SQL

  create_view "frm_preorder_subform1", sql_definition: <<-SQL
      SELECT tblpreorder.preorderid,
      (tblpreorder.preorderdate)::date AS preorderdate,
      tblpreorder.preorderbatch,
      tblpreorder.preordernotes,
      tblpreorder.preordersh1,
      tblpreorder.preordersh2,
      tblpreorder.preordervendorid,
      tblpreorder.orderid,
      (tblpreorder.ordercreatedate)::date AS ordercreatedate,
      (tblpreorder.preorderanalysisdate)::date AS preorderanalysisdate,
      (tblpreorder.confirmationdate)::date AS confirmationdate,
      (tblpreorder.preordercheck)::date AS preordercheck,
      tblcustomer.custid,
      tblcustomer.custname,
      tblcustomer.custbusinessname,
      tblcustomer.custfirst,
      tblcustomer.custlast,
      tblcustomer.custsal,
      tblcustomer.custtitle,
      tblcustomer.custaddress,
      tblcustomer.custcity,
      tblcustomer.custst,
      tblcustomer.custzip,
      tblcustomer.custphone,
      tblcustomer.custfax,
      tblcustomer.custemail,
      tblcustomer.custprimarycontact1,
      tblcustomer.custphone1,
      tblcustomer.custphonetype1,
      tblcustomer.custemail1,
      tblcustomer.custprimarycontact2,
      tblcustomer.custphone2,
      tblcustomer.custphonetype2,
      tblcustomer.custemail2,
      tblcustomer.custtaxrate,
      tblcustomer.custnotes,
      tblcustomer.custdatecreated,
      tblcustomer.custdatemodified,
      tblcustomer.custbillingbusinessname,
      tblcustomer.custbillingfirst,
      tblcustomer.custbillinglast,
      tblcustomer.custbillingsal,
      tblcustomer.custbillingtitle,
      tblcustomer.custbillingaddress,
      tblcustomer.custbillingcity,
      tblcustomer.custbillingst,
      tblcustomer.custbillingzip,
      tblcustomer.custbillingphone,
      tblcustomer.custbillingfax,
      tblcustomer.custbillingemail,
      tblcustomer.custbillingsame,
      tblcustomer.custqbo,
      tblcustomer.custccauth,
      tblcustomer.custcclast4,
      tblcustomer.custtaxjurisid,
      tblcustomer.lastrewarddate,
      tblcustomer.custhsacct,
      tblcustomer.discontinued,
      tblcustomer.custtyfirstname,
      tblcustomer.custtylastname,
      tblcustomer.custtyaddress,
      tblcustomer.custtycity,
      tblcustomer.custtyst,
      tblcustomer.custtyzip,
      tblcustomer.custtyphone,
      tblcustomer.custtyemail,
      tblsupplier.splrbusinessname
     FROM ((tblpreorder
       JOIN tblsupplier ON ((tblpreorder.preordervendorid = tblsupplier.splrid)))
       JOIN tblcustomer ON ((tblpreorder.custid = tblcustomer.custid)));
  SQL
  create_view "frm_preorder_subform2", sql_definition: <<-SQL
      WITH qrypreordersku2 AS (
           SELECT tblsku_1.skuid,
              tblsku_1.sku,
              tblsku_1.manf AS manf2,
              tblsku_1.itemno AS itemno2,
              tblsku_1.skudesc AS skudesc2,
              tblsku_1.unitweight,
              tblsku_1.categoryid,
              tblsku_1.skuminunits,
              tblsku_1.skuminunitstype,
              tblsku_1.dcloc,
              tblsku_1.skuminpercs
             FROM tblsku tblsku_1
          )
   SELECT tblsku.skuid,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.dcloc,
      tblsku.skuminpercs,
      tblsku.vno01,
      tblsku.vsku01,
      tblsku.vhl01,
      tblsku.vno02,
      tblsku.vsku02,
      tblsku.vhl02,
      tblsku.vno03,
      tblsku.vsku03,
      tblsku.vhl03,
      tblsku.vno04,
      tblsku.vsku04,
      tblsku.vhl04,
      tblsku.vno05,
      tblsku.vsku05,
      tblsku.vhl05,
      tblsku.vno06,
      tblsku.vsku06,
      tblsku.vhl06,
      tblsku.vno07,
      tblsku.vsku07,
      tblsku.vhl07,
      tblsku.vno08,
      tblsku.vsku08,
      tblsku.vhl08,
      tblsku.vno09,
      tblsku.vsku09,
      tblsku.vhl09,
      tblsku.vno10,
      tblsku.vsku10,
      tblsku.vhl10,
      tblsku.skuhighprice,
      tblsku.skuhighpricevno,
      tblsku.skuhighpricedate,
      tblsku.skuclassid,
      tblsku.skumaxtemp,
      tblsku.skumintemp,
      tblsku.skunotes,
      tblpreorderitems.preorderitemsid,
      tblpreorderitems.preorderid,
      tblpreorderitems.poid,
      tblpreorderitems.skuid1,
      tblpreorderitems.skuid2,
      tblpreorderitems.orderquant1,
      tblpreorderitems.orderquant2,
      tblpreorderitems.orderpriceper1,
      tblpreorderitems.orderpriceper2,
      tblpreorderitems.orderpricetotal1,
      tblpreorderitems.orderpricetotal2,
      tblpreorderitems.orderaupriceper,
      tblpreorderitems.preorderitemcode,
      tblpreorderitems.orderdate,
      tblpreorderitems.preordernotes,
      tblpreorderitems.preorderurgent,
      (tblpurchaseorderitems.poordertotalper - tblpurchaseorderitems.poordertaxper) AS popriceper,
      qrypreordersku2.skudesc2,
      qrypreordersku2.manf2,
      qrypreordersku2.itemno2
     FROM ((tblpurchaseorderitems
       RIGHT JOIN (tblsku
       JOIN tblpreorderitems ON ((tblsku.skuid = tblpreorderitems.skuid1))) ON (((tblpurchaseorderitems.skuid = tblpreorderitems.skuid2) AND (tblpurchaseorderitems.poid = tblpreorderitems.poid))))
       LEFT JOIN qrypreordersku2 ON ((tblpreorderitems.skuid2 = qrypreordersku2.skuid)));
  SQL
  create_view "frm_preorder_subform3", sql_definition: <<-SQL
      SELECT tblpreorderitems.preorderitemsid,
      tblpreorderitems.preorderid,
      tblpreorderitems.poid,
      tblpreorderitems.skuid1,
      tblpreorderitems.skuid2,
      tblpreorderitems.orderquant1,
      tblpreorderitems.orderquant2,
      tblpreorderitems.orderpriceper1,
      tblpreorderitems.orderpriceper2,
      tblpreorderitems.orderpricetotal1,
      tblpreorderitems.orderpricetotal2,
      tblpreorderitems.orderaupriceper,
      tblpreorderitems.preorderitemcode,
      tblpreorderitems.orderdate,
      tblpreorderitems.preordernotes,
      tblpreorderitems.preorderurgent,
      tblsku.skuid,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.dcloc,
      tblsku.skuminpercs,
      tblsku.vno01,
      tblsku.vsku01,
      tblsku.vhl01,
      tblsku.vno02,
      tblsku.vsku02,
      tblsku.vhl02,
      tblsku.vno03,
      tblsku.vsku03,
      tblsku.vhl03,
      tblsku.vno04,
      tblsku.vsku04,
      tblsku.vhl04,
      tblsku.vno05,
      tblsku.vsku05,
      tblsku.vhl05,
      tblsku.vno06,
      tblsku.vsku06,
      tblsku.vhl06,
      tblsku.vno07,
      tblsku.vsku07,
      tblsku.vhl07,
      tblsku.vno08,
      tblsku.vsku08,
      tblsku.vhl08,
      tblsku.vno09,
      tblsku.vsku09,
      tblsku.vhl09,
      tblsku.vno10,
      tblsku.vsku10,
      tblsku.vhl10,
      tblsku.skuhighprice,
      tblsku.skuhighpricevno,
      tblsku.skuhighpricedate,
      tblsku.skuclassid,
      tblsku.skumaxtemp,
      tblsku.skumintemp,
      tblsku.skunotes
     FROM (tblsku
       JOIN tblpreorderitems ON ((tblsku.skuid = tblpreorderitems.skuid1)));
  SQL
  create_view "frm_preorder_subform4", sql_definition: <<-SQL
      SELECT tblpreorder.preorderid,
      tblpreorder.preorderdate,
      tblpreorder.preorderbatch,
      tblpreorder.custid,
      tblpreorder.preordernotes,
      tblpreorder.preordersh1,
      tblpreorder.preordersh2,
      tblpreorder.preordervendorid,
      tblpreorder.orderid,
      tblpreorder.ordercreatedate,
      tblcustomer.custemail1,
      tblpreorder.preorderanalysisdate,
      tblpreorder.confirmationdate,
      tblcustomer.lastrewarddate,
      tblcustomer.custprimarycontact1,
      tblcustomer.custprimarycontact2,
      tblcustomer.custemail2,
      tblpreorder.preordercheck
     FROM (tblpreorder
       LEFT JOIN tblcustomer ON ((tblpreorder.custid = tblcustomer.custid)));
  SQL
  create_view "frm_preorder_subform5", sql_definition: <<-SQL
      SELECT tblpreorderitems.preorderitemsid,
      tblpreorderitems.preorderid,
      tblpreorderitems.poid,
      tblpreorderitems.skuid1,
      tblpreorderitems.skuid2,
      tblpreorderitems.orderquant1,
      tblpreorderitems.orderquant2,
      tblpreorderitems.orderpriceper1,
      tblpreorderitems.orderpriceper2,
      tblpreorderitems.orderpricetotal1,
      tblpreorderitems.orderpricetotal2,
      tblpreorderitems.orderaupriceper,
      tblpreorderitems.preorderitemcode,
      tblpreorderitems.orderdate,
      tblpreorderitems.preordernotes,
      tblpreorderitems.preorderurgent,
      tblsku.skuid,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.dcloc,
      tblsku.skuminpercs,
      tblsku.vno01,
      tblsku.vsku01,
      tblsku.vhl01,
      tblsku.vno02,
      tblsku.vsku02,
      tblsku.vhl02,
      tblsku.vno03,
      tblsku.vsku03,
      tblsku.vhl03,
      tblsku.vno04,
      tblsku.vsku04,
      tblsku.vhl04,
      tblsku.vno05,
      tblsku.vsku05,
      tblsku.vhl05,
      tblsku.vno06,
      tblsku.vsku06,
      tblsku.vhl06,
      tblsku.vno07,
      tblsku.vsku07,
      tblsku.vhl07,
      tblsku.vno08,
      tblsku.vsku08,
      tblsku.vhl08,
      tblsku.vno09,
      tblsku.vsku09,
      tblsku.vhl09,
      tblsku.vno10,
      tblsku.vsku10,
      tblsku.vhl10,
      tblsku.skuhighprice,
      tblsku.skuhighpricevno,
      tblsku.skuhighpricedate,
      tblsku.skuclassid,
      tblsku.skumaxtemp,
      tblsku.skumintemp,
      tblsku.skunotes,
      (tblpurchaseorderitems.poordertotalper - tblpurchaseorderitems.poordertaxper) AS popriceper,
      tblpurchaseorderitems.poorderquant,
      tblpurchaseorderitems.poorderrcvdquant
     FROM (tblpurchaseorderitems
       RIGHT JOIN (tblsku
       JOIN tblpreorderitems ON ((tblsku.skuid = tblpreorderitems.skuid2))) ON (((tblpurchaseorderitems.poid = tblpreorderitems.poid) AND (tblpurchaseorderitems.skuid = tblpreorderitems.skuid2))));
  SQL
  create_view "qrypreorderhistoryunion", sql_definition: <<-SQL
      SELECT tblorder.orderdate,
      tblorderitems.skuid,
      tblpurchaseorder.splrid2,
      tblorderitems.orderquant,
      tblorderitems.orderpriceper,
      tblorder.custid,
      18 AS splrid,
      tblpurchaseorder.poid
     FROM (tblpurchaseorder
       RIGHT JOIN (tblorder
       RIGHT JOIN tblorderitems ON ((tblorder.orderid = tblorderitems.orderid))) ON ((tblpurchaseorder.poid = tblorderitems.poid)))
  UNION
   SELECT tblanalysisitems.aorderdate AS orderdate,
      tblanalysisitems.skuid,
      tblanalysisitems.splrid2,
      tblanalysisitems.aorderquant AS orderquant,
      tblanalysisitems.aorderpriceper AS orderpriceper,
      tblanalysisitems.customerid AS custid,
      tblanalysisitems.splrid,
      tblanalysisitems.analysisitemsid AS poid
     FROM tblanalysisitems;
  SQL
  create_view "frm_preorder_subform6", sql_definition: <<-SQL
      SELECT qrypreorderhistoryunion.skuid,
      qrypreorderhistoryunion.orderdate,
      qrypreorderhistoryunion.orderquant,
      qrypreorderhistoryunion.orderpriceper,
      qrypreorderhistoryunion.splrid2,
      qrypreorderhistoryunion.splrid,
      tblcustomer.custbusinessname,
      qrypreorderhistoryunion.custid
     FROM (tblcustomer
       JOIN qrypreorderhistoryunion ON ((tblcustomer.custid = qrypreorderhistoryunion.custid)))
    ORDER BY qrypreorderhistoryunion.orderdate DESC;
  SQL
  create_view "frm_sku_cust_info_subform1", sql_definition: <<-SQL
      SELECT tblskucustinfo.skuid,
      tblskucustinfo.custid,
      tblskucustinfo.skunever,
      tblskucustinfo.skuneverdate,
      tblcustomer.custname,
      tblcustomer.custbusinessname,
      tblcustomer.custlast
     FROM (tblskucustinfo
       JOIN tblcustomer ON ((tblskucustinfo.custid = tblcustomer.custid)))
    WHERE (tblskucustinfo.skunever = true);
  SQL
  create_view "frm_sku_cust_info_subform2", sql_definition: <<-SQL
      SELECT tblskucustinfo.skuid,
      tblskucustinfo.custid,
      tblskucustinfo.skunever,
      tblskucustinfo.skuneverdate,
      tblcustomer.custname,
      tblcustomer.custbusinessname,
      tblcustomer.custlast
     FROM (tblskucustinfo
       JOIN tblcustomer ON ((tblskucustinfo.custid = tblcustomer.custid)))
    WHERE (tblskucustinfo.skuonly = true);
  SQL
  create_view "qryinventorycounts", sql_definition: <<-SQL
      WITH qrypoinventorycounts AS (
           SELECT tblsku_1.skuid,
              tblsku_1.sku,
              tblsku_1.manf,
              tblsku_1.itemno,
              tblsku_1.skudesc,
              sum(COALESCE(tblpurchaseorderitems.poorderquant, 0)) AS pototal,
              sum(COALESCE(tblpurchaseorderitems.poorderrcvdquant, 0)) AS pototalrcvd
             FROM (tblsku tblsku_1
               JOIN tblpurchaseorderitems ON ((tblsku_1.skuid = tblpurchaseorderitems.skuid)))
            GROUP BY tblsku_1.skuid, tblsku_1.sku, tblsku_1.manf, tblsku_1.itemno, tblsku_1.skudesc
          ), qryorderinventorycounts AS (
           SELECT tblsku_1.skuid,
              tblsku_1.sku,
              tblsku_1.manf,
              tblsku_1.itemno,
              tblsku_1.skudesc,
              sum(COALESCE(tblorderitems.orderquant, 0)) AS ordquant,
              sum(COALESCE(tblorderitems.orderdeliveredquant, 0)) AS orddelquant
             FROM (tblsku tblsku_1
               JOIN tblorderitems ON ((tblsku_1.skuid = tblorderitems.skuid)))
            GROUP BY tblsku_1.skuid, tblsku_1.sku, tblsku_1.manf, tblsku_1.itemno, tblsku_1.skudesc
          )
   SELECT qrypoinventorycounts.skuid,
      qrypoinventorycounts.sku,
      qrypoinventorycounts.manf,
      qrypoinventorycounts.itemno,
      qrypoinventorycounts.skudesc,
      s1.total,
      (s1.total * tblsku.skuminunits) AS totalunits,
      tblsku.skuminpercs,
      (s1.total / tblsku.skuminpercs) AS totalcases,
      tblsku.dcloc,
      tblsku.categoryid,
      s1.totalrcvd,
      (s1.totalrcvd * tblsku.skuminunits) AS totalunitsrcvd,
      (s1.totalrcvd / tblsku.skuminpercs) AS totalcasesrcvd,
      (s1.total - s1.totalrcvd) AS totaldue,
      (qrypoinventorycounts.pototalrcvd - COALESCE(qryorderinventorycounts.orddelquant, (0)::bigint)) AS dccurquant,
      COALESCE(qryorderinventorycounts.ordquant, (0)::bigint) AS sold,
      COALESCE(qrypoinventorycounts.pototal, (0)::bigint) AS bought
     FROM ((tblsku
       LEFT JOIN qryorderinventorycounts ON ((tblsku.skuid = qryorderinventorycounts.skuid)))
       LEFT JOIN qrypoinventorycounts ON ((tblsku.skuid = qrypoinventorycounts.skuid))),
      LATERAL ( SELECT (qrypoinventorycounts.pototal - COALESCE(qryorderinventorycounts.ordquant, (0)::bigint)),
              (qrypoinventorycounts.pototalrcvd - COALESCE(qryorderinventorycounts.ordquant, (0)::bigint))) s1(total, totalrcvd);
  SQL
  create_view "qryinventorycountsfilter", sql_definition: <<-SQL
      WITH qrypoinventorycountsfilter AS (
           SELECT tblsku.skuid,
              tblsku.sku,
              tblsku.manf,
              tblsku.itemno,
              tblsku.skudesc,
              sum(COALESCE(tblpurchaseorderitems.poorderquant, 0)) AS pototal,
              sum(COALESCE(tblpurchaseorderitems.poorderrcvdquant, 0)) AS pototalrcvd
             FROM (tblsku
               LEFT JOIN tblpurchaseorderitems ON ((tblsku.skuid = tblpurchaseorderitems.skuid)))
            GROUP BY tblsku.skuid, tblsku.sku, tblsku.manf, tblsku.itemno, tblsku.skudesc
          ), qryorderinventorycountsfilter AS (
           SELECT tblsku.skuid,
              tblsku.sku,
              tblsku.manf,
              tblsku.itemno,
              tblsku.skudesc,
              sum(COALESCE(tblorderitems.orderquant, 0)) AS ordquant,
              sum(COALESCE(tblorderitems.orderdeliveredquant, 0)) AS orddelquant
             FROM (tblsku
               LEFT JOIN tblorderitems ON ((tblsku.skuid = tblorderitems.skuid)))
            GROUP BY tblsku.skuid, tblsku.sku, tblsku.manf, tblsku.itemno, tblsku.skudesc
          )
   SELECT qrypoinventorycountsfilter.skuid,
      (((qrypoinventorycountsfilter.pototalrcvd - COALESCE(qryorderinventorycountsfilter.orddelquant, (0)::bigint)))::integer)::boolean AS indc
     FROM (qrypoinventorycountsfilter
       LEFT JOIN qryorderinventorycountsfilter ON ((qrypoinventorycountsfilter.skuid = qryorderinventorycountsfilter.skuid)))
    GROUP BY qrypoinventorycountsfilter.skuid, (qrypoinventorycountsfilter.pototalrcvd - COALESCE(qryorderinventorycountsfilter.orddelquant, (0)::bigint));
  SQL
  create_view "frm_sku_subform1", sql_definition: <<-SQL
      SELECT tblsku.skuid,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.dcloc,
      tblsku.skuminpercs,
      tblsku.vno01,
      tblsku.vsku01,
      tblsku.vhl01,
      tblsku.vno02,
      tblsku.vsku02,
      tblsku.vhl02,
      tblsku.vno03,
      tblsku.vsku03,
      tblsku.vhl03,
      tblsku.vno04,
      tblsku.vsku04,
      tblsku.vhl04,
      tblsku.vno05,
      tblsku.vsku05,
      tblsku.vhl05,
      tblsku.vno06,
      tblsku.vsku06,
      tblsku.vhl06,
      tblsku.vno07,
      tblsku.vsku07,
      tblsku.vhl07,
      tblsku.vno08,
      tblsku.vsku08,
      tblsku.vhl08,
      tblsku.vno09,
      tblsku.vsku09,
      tblsku.vhl09,
      tblsku.vno10,
      tblsku.vsku10,
      tblsku.vhl10,
      tblsku.skuhighprice,
      tblsku.skuhighpricevno,
      tblsku.skuhighpricedate,
      tblsku.skuclassid,
      tblsku.skumaxtemp,
      tblsku.skumintemp,
      tblsku.skunotes,
      tblsku.tsv,
      qryinventorycounts.total,
      qryinventorycounts.totalcases,
      qryinventorycounts.totalrcvd,
      qryinventorycounts.totalcasesrcvd,
      qryinventorycounts.totaldue,
      concat_ws('_'::text, tblsku.vsku01, tblsku.vsku02, tblsku.vsku03, tblsku.vsku04, tblsku.vsku05, tblsku.vsku06, tblsku.vsku07, tblsku.vsku08, tblsku.vsku09, tblsku.vsku10) AS vskuconcat,
      qryinventorycounts.dccurquant,
      qryinventorycounts.sold,
      qryinventorycounts.bought,
      qryinventorycountsfilter.indc,
      tblskuclass.skuclassdesc
     FROM (((tblsku
       LEFT JOIN tblskuclass ON ((tblsku.skuclassid = tblskuclass.skuclassid)))
       LEFT JOIN qryinventorycounts ON ((tblsku.skuid = qryinventorycounts.skuid)))
       JOIN qryinventorycountsfilter ON ((tblsku.skuid = qryinventorycountsfilter.skuid)));
  SQL
  create_view "qryskuorderhistoryunion", sql_definition: <<-SQL
      SELECT tblorder.orderdate,
      tblorderitems.skuid,
      tblpurchaseorder.splrid2,
      tblorderitems.orderquant,
      tblorderitems.orderpriceper,
      tblorder.custid,
      18 AS splrid,
      tblpurchaseorder.poid
     FROM (tblpurchaseorder
       RIGHT JOIN (tblorder
       RIGHT JOIN tblorderitems ON ((tblorder.orderid = tblorderitems.orderid))) ON ((tblpurchaseorder.poid = tblorderitems.poid)))
  UNION
   SELECT tblanalysisitems.aorderdate AS orderdate,
      tblanalysisitems.skuid,
      tblanalysisitems.splrid2,
      tblanalysisitems.aorderquant AS orderquant,
      tblanalysisitems.aorderpriceper AS orderpriceper,
      tblanalysisitems.customerid AS custid,
      tblanalysisitems.splrid,
      0 AS poid
     FROM tblanalysisitems
  UNION
   SELECT tblpreorder.preorderdate AS orderdate,
      tblpreorderitems.skuid1 AS skuid,
      tblpreorder.preordervendorid AS splrid2,
      tblpreorderitems.orderquant1 AS orderquant,
      tblpreorderitems.orderpriceper1 AS orderpriceper,
      tblpreorder.custid,
      tblpreorder.preordervendorid AS splrid,
      4444 AS poid
     FROM (tblpreorderitems
       JOIN tblpreorder ON ((tblpreorderitems.preorderid = tblpreorder.preorderid)))
    WHERE (tblpreorderitems.preorderitemcode = 4)
  UNION
   SELECT tblpreorder.preorderdate AS orderdate,
      tblpreorderitems.skuid2 AS skuid,
      2 AS splrid2,
      tblpreorderitems.orderquant2 AS orderquant,
      tblpreorderitems.orderpriceper2 AS orderpriceper,
      tblpreorder.custid,
      2 AS splrid,
      5555 AS poid
     FROM (tblpreorderitems
       JOIN tblpreorder ON ((tblpreorderitems.preorderid = tblpreorder.preorderid)))
    WHERE (tblpreorderitems.preorderitemcode = 5);
  SQL
  create_view "frm_sku_subform3", sql_definition: <<-SQL
      SELECT qryskuorderhistoryunion.skuid,
      qryskuorderhistoryunion.orderdate,
      qryskuorderhistoryunion.orderquant,
      qryskuorderhistoryunion.orderpriceper,
      qryskuorderhistoryunion.splrid2,
      qryskuorderhistoryunion.splrid,
      tblcustomer.custbusinessname,
      qryskuorderhistoryunion.custid,
      qryskuorderhistoryunion.poid
     FROM (qryskuorderhistoryunion
       JOIN tblcustomer ON ((qryskuorderhistoryunion.custid = tblcustomer.custid)))
    ORDER BY qryskuorderhistoryunion.orderdate DESC;
  SQL
  create_view "update_dc_inventory_counts", sql_definition: <<-SQL
      WITH qryupdatedcorderinventorycounts AS (
           SELECT tblsku_1.skuid,
              sum(tblorderitems.orderquant) AS ordquant,
              sum(tblorderitems.orderdeliveredquant) AS orddelquant
             FROM (tblsku tblsku_1
               JOIN tblorderitems ON ((tblsku_1.skuid = tblorderitems.skuid)))
            GROUP BY tblsku_1.skuid
          ), qryupdatedcpoinventorycounts AS (
           SELECT tblsku_1.skuid,
              sum(tblpurchaseorderitems.poorderquant) AS pototal,
              sum(tblpurchaseorderitems.poorderrcvdquant) AS pototalrcvd
             FROM (tblsku tblsku_1
               JOIN tblpurchaseorderitems ON ((tblsku_1.skuid = tblpurchaseorderitems.skuid)))
            GROUP BY tblsku_1.skuid
          )
   SELECT qryupdatedcpoinventorycounts.skuid,
      s1.total,
      s1.totalrcvd,
      s1.dccurquant,
      (s1.total * tblsku.skuminunits) AS totalunits,
      (s1.total / tblsku.skuminpercs) AS totalcases,
      tblsku.skuminpercs,
      (s1.totalrcvd * tblsku.skuminunits) AS totalunitsrcvd,
      (s1.totalrcvd / tblsku.skuminpercs) AS totalcasesrcvd,
      (s1.total - s1.totalrcvd) AS totaldue,
      COALESCE(qryupdatedcorderinventorycounts.ordquant, (0)::bigint) AS sold,
      COALESCE(qryupdatedcpoinventorycounts.pototal, (0)::bigint) AS bought
     FROM ((tblsku
       JOIN qryupdatedcpoinventorycounts ON ((tblsku.skuid = qryupdatedcpoinventorycounts.skuid)))
       LEFT JOIN qryupdatedcorderinventorycounts ON ((tblsku.skuid = qryupdatedcorderinventorycounts.skuid))),
      LATERAL ( SELECT (qryupdatedcpoinventorycounts.pototal - COALESCE(qryupdatedcorderinventorycounts.ordquant, (0)::bigint)),
              (qryupdatedcpoinventorycounts.pototalrcvd - COALESCE(qryupdatedcorderinventorycounts.ordquant, (0)::bigint)),
              (qryupdatedcpoinventorycounts.pototalrcvd - COALESCE(qryupdatedcorderinventorycounts.orddelquant, (0)::bigint))) s1(total, totalrcvd, dccurquant);
  SQL
  create_view "pre_order_items_outstandings", sql_definition: <<-SQL
      SELECT tblpreorderitems.skuid2,
      tblpreorder.preorderid,
      tblpreorder.preorderdate,
      tblpreorderitems.preorderitemsid,
      tblcustomer.custbusinessname,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblpreorderitems.orderaupriceper,
      tblpreorderitems.preordernotes,
      tblpreorderitems.orderquant2,
      update_dc_inventory_counts.dccurquant,
      update_dc_inventory_counts.totaldue,
      tblpreorderitems.orderpriceper2,
      tblpreorderitems.orderpricetotal2,
      tblpreorderitems.preorderitemcode,
      tblpreorderitems.poid,
      (update_dc_inventory_counts.dccurquant + update_dc_inventory_counts.totaldue) AS avail
     FROM ((((tblsku
       JOIN tblpreorderitems ON ((tblsku.skuid = tblpreorderitems.skuid2)))
       JOIN tblpreorder ON ((tblpreorderitems.preorderid = tblpreorder.preorderid)))
       JOIN tblcustomer ON ((tblpreorder.custid = tblcustomer.custid)))
       LEFT JOIN update_dc_inventory_counts ON ((tblsku.skuid = update_dc_inventory_counts.skuid)))
    WHERE ((tblpreorderitems.preorderitemcode < 4) AND ((tblpreorderitems.poid = 0) OR (tblpreorderitems.poid IS NULL)));
  SQL
  create_view "qryInventoryCounts", sql_definition: <<-SQL
      WITH qrypoinventorycounts AS (
           SELECT tblsku_1.skuid,
              tblsku_1.sku,
              tblsku_1.manf,
              tblsku_1.itemno,
              tblsku_1.skudesc,
              sum(COALESCE(tblpurchaseorderitems.poorderquant, 0)) AS pototal,
              sum(COALESCE(tblpurchaseorderitems.poorderrcvdquant, 0)) AS pototalrcvd
             FROM (tblsku tblsku_1
               JOIN tblpurchaseorderitems ON ((tblsku_1.skuid = tblpurchaseorderitems.skuid)))
            GROUP BY tblsku_1.skuid, tblsku_1.sku, tblsku_1.manf, tblsku_1.itemno, tblsku_1.skudesc
          ), qryorderinventorycounts AS (
           SELECT tblsku_1.skuid,
              tblsku_1.sku,
              tblsku_1.manf,
              tblsku_1.itemno,
              tblsku_1.skudesc,
              sum(COALESCE(tblorderitems.orderquant, 0)) AS ordquant,
              sum(COALESCE(tblorderitems.orderdeliveredquant, 0)) AS orddelquant
             FROM (tblsku tblsku_1
               JOIN tblorderitems ON ((tblsku_1.skuid = tblorderitems.skuid)))
            GROUP BY tblsku_1.skuid, tblsku_1.sku, tblsku_1.manf, tblsku_1.itemno, tblsku_1.skudesc
          )
   SELECT qrypoinventorycounts.skuid,
      qrypoinventorycounts.sku,
      qrypoinventorycounts.manf,
      qrypoinventorycounts.itemno,
      qrypoinventorycounts.skudesc,
      s1.total,
      (s1.total * tblsku.skuminunits) AS totalunits,
      tblsku.skuminpercs,
      (s1.total / tblsku.skuminpercs) AS totalcases,
      tblsku.dcloc,
      tblsku.categoryid,
      s1.totalrcvd,
      (s1.totalrcvd * tblsku.skuminunits) AS totalunitsrcvd,
      (s1.totalrcvd / tblsku.skuminpercs) AS totalcasesrcvd,
      (s1.total - s1.totalrcvd) AS totaldue,
      (qrypoinventorycounts.pototalrcvd - COALESCE(qryorderinventorycounts.orddelquant, (0)::bigint)) AS dccurquant,
      COALESCE(qryorderinventorycounts.ordquant, (0)::bigint) AS sold,
      COALESCE(qrypoinventorycounts.pototal, (0)::bigint) AS bought
     FROM ((tblsku
       LEFT JOIN qryorderinventorycounts ON ((tblsku.skuid = qryorderinventorycounts.skuid)))
       LEFT JOIN qrypoinventorycounts ON ((tblsku.skuid = qrypoinventorycounts.skuid))),
      LATERAL ( SELECT (qrypoinventorycounts.pototal - COALESCE(qryorderinventorycounts.ordquant, (0)::bigint)),
              (qrypoinventorycounts.pototalrcvd - COALESCE(qryorderinventorycounts.ordquant, (0)::bigint))) s1(total, totalrcvd);
  SQL
  create_view "qryskupohistau", sql_definition: <<-SQL
      SELECT tblpurchaseorder.podate,
      tblpurchaseorderitems.skuid,
      tblpurchaseorder.splrid2,
      tblsupplier.splrname,
      tblpurchaseorderitems.poorderquant,
      tblpurchaseorderitems.poorderpriceper,
      (tblpurchaseorderitems.poordertotalper - tblpurchaseorderitems.poordertaxper) AS priceeachlesstax,
      tblpurchaseorder.poid,
      tblpurchaseorderitems.poorderrcvdquant,
      (tblpurchaseorderitems.poorderquant - tblpurchaseorderitems.poorderrcvdquant) AS podiff,
      tblpurchaseorderitems.poorderexpiration
     FROM ((tblsupplier
       JOIN tblpurchaseorder ON ((tblsupplier.splrid = tblpurchaseorder.splrid2)))
       JOIN tblpurchaseorderitems ON ((tblpurchaseorder.poid = tblpurchaseorderitems.poid)));
  SQL
  create_view "qrySKUPOHistAU2", sql_definition: <<-SQL
      SELECT qryskupohistau.podate,
      qryskupohistau.skuid,
      qryskupohistau.splrid2,
      qryskupohistau.splrname,
      qryskupohistau.poorderquant,
      qryskupohistau.poorderrcvdquant,
      qryskupohistau.podiff,
      qryskupohistau.poorderpriceper,
      qryskupohistau.priceeachlesstax,
      qryskupohistau.poid,
      sum(tblorderitems.orderquant) AS sumoforderquant,
      sum(tblorderitems.orderdeliveredquant) AS sumoforderdeliveredquant,
      (qryskupohistau.poorderquant - COALESCE(sum(tblorderitems.orderquant), (0)::bigint)) AS available,
      (qryskupohistau.poorderrcvdquant - COALESCE(sum(tblorderitems.orderdeliveredquant), (0)::bigint)) AS in_dc,
      qryskupohistau.poorderexpiration
     FROM (qryskupohistau
       LEFT JOIN tblorderitems ON (((qryskupohistau.poid = tblorderitems.poid) AND (qryskupohistau.skuid = tblorderitems.skuid))))
    GROUP BY qryskupohistau.podate, qryskupohistau.skuid, qryskupohistau.splrid2, qryskupohistau.splrname, qryskupohistau.poorderquant, qryskupohistau.poorderrcvdquant, qryskupohistau.podiff, qryskupohistau.poorderpriceper, qryskupohistau.priceeachlesstax, qryskupohistau.poid, qryskupohistau.poorderexpiration;
  SQL
  create_view "qry_order_items_outstanding", sql_definition: <<-SQL
      SELECT gen_random_uuid() AS id,
      tblorder.orderid,
      tblorder.orderdate,
      tblorder.orderbatch,
      tblorder.custid,
      tblorder.ordertaxrate,
      tblorder.orderdelivereddate,
      tblorder.orderdeliverdfrom,
      tblorder.orderdeliveredto,
      tblorder.ordershipmethod,
      tblorder.orderreceipthl,
      tblorder.orderdateinvoiced,
      tblorder.orderdatepaid,
      tblorder.orderpaymentmethod,
      tblorder.orderpaymentamount,
      tblorder.ordernotes,
      tblorderitems.orderitemsid,
      tblorderitems.skuid,
      tblorderitems.poid,
      tblorderitems.orderquant,
      tblorderitems.orderdeliveredquant,
      s1.orderquantdue,
      tblorderitems.orderpriceper,
      tblorderitems.orderpricetotal,
      tblorderitems.ordertaxrate AS order_item_tax_rate,
      tblorderitems.ordertaxtotal,
      tblorderitems.orderdeliverycosttotal,
      tblorderitems.orderfeestotal,
      tblorderitems.ordergrandtotal,
      tblorderitems.orderitemsdelivereddate,
      tblorderitems.orderretailtotal,
      tblcustomer.custname,
      tblcustomer.custbusinessname,
      tblcustomer.custfirst,
      tblcustomer.custlast,
      tblcustomer.custsal,
      tblcustomer.custtitle,
      tblcustomer.custaddress,
      tblcustomer.custcity,
      tblcustomer.custst,
      tblcustomer.custzip,
      tblcustomer.custphone,
      tblcustomer.custfax,
      tblcustomer.custemail,
      tblcustomer.custprimarycontact1,
      tblcustomer.custphone1,
      tblcustomer.custphonetype1,
      tblcustomer.custemail1,
      tblcustomer.custprimarycontact2,
      tblcustomer.custphone2,
      tblcustomer.custphonetype2,
      tblcustomer.custemail2,
      tblcustomer.custtaxrate,
      tblcustomer.custnotes,
      tblcustomer.custdatecreated,
      tblcustomer.custdatemodified,
      tblcustomer.custbillingbusinessname,
      tblcustomer.custbillingfirst,
      tblcustomer.custbillinglast,
      tblcustomer.custbillingsal,
      tblcustomer.custbillingtitle,
      tblcustomer.custbillingaddress,
      tblcustomer.custbillingcity,
      tblcustomer.custbillingst,
      tblcustomer.custbillingzip,
      tblcustomer.custbillingphone,
      tblcustomer.custbillingfax,
      tblcustomer.custbillingemail,
      tblcustomer.custbillingsame,
      tblcustomer.custqbo,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.dcloc,
      tblsku.skuminpercs,
      qryinventorycounts.total,
      qryinventorycounts.totalrcvd,
      qryinventorycounts.totaldue,
      qryinventorycounts.dccurquant,
      tblsku.has_issue
     FROM ((((tblsku
       JOIN tblorderitems ON ((tblsku.skuid = tblorderitems.skuid)))
       JOIN tblorder ON ((tblorderitems.orderid = tblorder.orderid)))
       JOIN tblcustomer ON ((tblcustomer.custid = tblorder.custid)))
       LEFT JOIN qryinventorycounts ON ((tblsku.skuid = qryinventorycounts.skuid))),
      LATERAL ( SELECT (tblorderitems.orderquant - tblorderitems.orderdeliveredquant)) s1(orderquantdue)
    WHERE (s1.orderquantdue > 0)
    ORDER BY tblorder.orderid;
  SQL
  create_view "qryorderccbilldue", sql_definition: <<-SQL
      SELECT tblorder.orderid,
      tblorder.orderdate,
      tblorder.orderbatch,
      tblorder.custid,
      tblorder.ordertaxrate,
      tblorder.orderdelivereddate,
      tblorder.orderdeliverdfrom,
      tblorder.orderdeliveredto,
      tblorder.ordershipmethod,
      tblorder.orderreceipthl,
      tblorder.orderdateinvoiced,
      tblorder.orderdatepaid,
      tblorder.orderpaymentmethod,
      tblorder.orderpaymentamount,
      tblorder.ordernotes,
      tblorder.orderccdate,
      tblcustomer.custccauth,
      tblcustomer.custbusinessname
     FROM (tblcustomer
       JOIN tblorder ON ((tblcustomer.custid = tblorder.custid)))
    WHERE ((tblorder.orderdelivereddate IS NOT NULL) AND (tblorder.orderdatepaid IS NULL) AND (tblorder.orderccdate IS NULL) AND (tblcustomer.custccauth = true));
  SQL
  create_view "qryorderdatashippinglist", sql_definition: <<-SQL
      SELECT tblcustomer.custid,
      tblcustomer.custname,
      tblcustomer.custfirst,
      tblcustomer.custlast,
      tblcustomer.custsal,
      tblcustomer.custtitle,
      tblcustomer.custbusinessname,
      tblcustomer.custaddress,
      tblcustomer.custcity,
      tblcustomer.custst,
      tblcustomer.custzip,
      tblcustomer.custprimarycontact1,
      tblcustomer.custphone1,
      tblcustomer.custphonetype1,
      tblcustomer.custemail1,
      tblcustomer.custprimarycontact2,
      tblcustomer.custphone2,
      tblcustomer.custphonetype2,
      tblcustomer.custemail2,
      tblcustomer.custfax,
      tblcustomer.custtaxrate,
      tblcustomer.custccauth,
      tblcustomer.custcclast4,
      tblorder.orderid,
      tblorder.orderdate,
      tblorder.orderbatch,
      tblorder.ordertaxrate,
      tblorder.ordernotes,
      tblorder.preordercompletedate,
      tblorderitems.skuid,
      sum(tblorderitems.orderdeliverycosttotal) AS sumoforderdeliverycosttotal,
      sum(tblorderitems.ordertaxtotal) AS sumofordertaxtotal,
      sum(tblorderitems.ordergrandtotal) AS sumofordergrandtotal,
      sum(tblorderitems.orderquant) AS sumoforderquant,
      sum(tblorderitems.orderpricetotal) AS sumoforderpricetotal,
      sum(tblorderitems.orderdeliveredquant) AS sumoforderdeliveredquant,
      tblorderitems.orderpriceper,
      tblorderitems.orderitemsdelivereddate,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.skuminpercs
     FROM (((tblsku
       JOIN tblorderitems ON ((tblsku.skuid = tblorderitems.skuid)))
       JOIN tblorder ON ((tblorder.orderid = tblorderitems.orderid)))
       JOIN tblcustomer ON ((tblcustomer.custid = tblorder.custid)))
    GROUP BY tblcustomer.custid, tblcustomer.custname, tblcustomer.custfirst, tblcustomer.custlast, tblcustomer.custsal, tblcustomer.custtitle, tblcustomer.custbusinessname, tblcustomer.custaddress, tblcustomer.custcity, tblcustomer.custst, tblcustomer.custzip, tblcustomer.custprimarycontact1, tblcustomer.custphone1, tblcustomer.custphonetype1, tblcustomer.custemail1, tblcustomer.custprimarycontact2, tblcustomer.custphone2, tblcustomer.custphonetype2, tblcustomer.custemail2, tblcustomer.custfax, tblcustomer.custtaxrate, tblorder.orderid, tblorder.orderdate, tblorder.orderbatch, tblorder.custid, tblorder.ordertaxrate, tblorder.ordernotes, tblorderitems.skuid, tblorderitems.orderpriceper, tblorderitems.orderitemsdelivereddate, tblsku.skuid, tblsku.sku, tblsku.manf, tblsku.itemno, tblsku.skudesc, tblsku.unitweight, tblsku.categoryid, tblsku.skuminunits, tblsku.skuminunitstype, tblsku.skuminpercs, tblcustomer.custccauth, tblcustomer.custcclast4, tblorder.preordercompletedate;
  SQL
  create_view "qryorderdatashippinglist2", sql_definition: <<-SQL
      SELECT tblcustomer.custid,
      tblcustomer.custname,
      tblcustomer.custfirst,
      tblcustomer.custlast,
      tblcustomer.custsal,
      tblcustomer.custtitle,
      tblcustomer.custbusinessname,
      tblcustomer.custaddress,
      tblcustomer.custcity,
      tblcustomer.custst,
      tblcustomer.custzip,
      tblcustomer.custprimarycontact1,
      tblcustomer.custphone1,
      tblcustomer.custphonetype1,
      tblcustomer.custemail1,
      tblcustomer.custprimarycontact2,
      tblcustomer.custphone2,
      tblcustomer.custphonetype2,
      tblcustomer.custemail2,
      tblcustomer.custfax,
      tblcustomer.custtaxrate,
      tblcustomer.custccauth,
      tblcustomer.custcclast4,
      tblcustomer.custbillingbusinessname,
      tblcustomer.custbillingfirst,
      tblcustomer.custbillinglast,
      tblcustomer.custbillingsal,
      tblcustomer.custbillingtitle,
      tblcustomer.custbillingaddress,
      tblcustomer.custbillingcity,
      tblcustomer.custbillingst,
      tblcustomer.custbillingzip,
      tblcustomer.custbillingphone,
      tblcustomer.custbillingfax,
      tblcustomer.custbillingemail,
      tblcustomer.custbillingsame,
      tblorder.orderid,
      tblorder.orderdate,
      tblorder.orderbatch,
      tblorder.ordertaxrate,
      tblorder.ordernotes,
      tblorder.preordercompletedate,
      sum(tblorderitems.orderdeliverycosttotal) AS sumoforderdeliverycosttotal,
      sum(tblorderitems.ordertaxtotal) AS sumofordertaxtotal,
      sum(tblorderitems.ordergrandtotal) AS sumofordergrandtotal,
      sum(tblorderitems.orderquant) AS sumoforderquant,
      sum(tblorderitems.orderpricetotal) AS sumoforderpricetotal,
      sum(tblorderitems.orderdeliveredquant) AS sumoforderdeliveredquant,
      tblorderitems.orderpriceper,
      tblorderitems.orderitemsdelivereddate,
      tblsku.skuid,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.skuminpercs
     FROM (((tblsku
       JOIN tblorderitems ON ((tblsku.skuid = tblorderitems.skuid)))
       JOIN tblorder ON ((tblorder.orderid = tblorderitems.orderid)))
       JOIN tblcustomer ON ((tblcustomer.custid = tblorder.custid)))
    GROUP BY tblcustomer.custid, tblcustomer.custname, tblcustomer.custfirst, tblcustomer.custlast, tblcustomer.custsal, tblcustomer.custtitle, tblcustomer.custbusinessname, tblcustomer.custaddress, tblcustomer.custcity, tblcustomer.custst, tblcustomer.custzip, tblcustomer.custprimarycontact1, tblcustomer.custphone1, tblcustomer.custphonetype1, tblcustomer.custemail1, tblcustomer.custprimarycontact2, tblcustomer.custphone2, tblcustomer.custphonetype2, tblcustomer.custemail2, tblcustomer.custfax, tblcustomer.custtaxrate, tblorder.orderid, tblorder.orderdate, tblorder.orderbatch, tblorder.custid, tblorder.ordertaxrate, tblorder.ordernotes, tblorderitems.skuid, tblorderitems.orderpriceper, tblorderitems.orderitemsdelivereddate, tblsku.skuid, tblsku.sku, tblsku.manf, tblsku.itemno, tblsku.skudesc, tblsku.unitweight, tblsku.categoryid, tblsku.skuminunits, tblsku.skuminunitstype, tblsku.skuminpercs, tblcustomer.custccauth, tblcustomer.custcclast4, tblorder.preordercompletedate, tblcustomer.custbillingbusinessname, tblcustomer.custbillingfirst, tblcustomer.custbillinglast, tblcustomer.custbillingsal, tblcustomer.custbillingtitle, tblcustomer.custbillingaddress, tblcustomer.custbillingcity, tblcustomer.custbillingst, tblcustomer.custbillingzip, tblcustomer.custbillingphone, tblcustomer.custbillingfax, tblcustomer.custbillingemail, tblcustomer.custbillingsame;
  SQL
  create_view "qrypreorderpohistau", sql_definition: <<-SQL
      SELECT tblpurchaseorder.podate,
      tblpurchaseorderitems.skuid,
      tblpurchaseorder.splrid2,
      tblsupplier.splrname,
      tblpurchaseorderitems.poorderquant,
      tblpurchaseorderitems.poorderpriceper,
      s1.priceeachlesstax,
      tblpurchaseorder.poid,
      tblpurchaseorderitems.poorderrcvdquant,
      s1.podiff,
      tblpurchaseorderitems.poorderexpiration
     FROM ((tblsupplier
       JOIN tblpurchaseorder ON ((tblsupplier.splrid = tblpurchaseorder.splrid2)))
       JOIN tblpurchaseorderitems ON ((tblpurchaseorder.poid = tblpurchaseorderitems.poid))),
      LATERAL ( SELECT (tblpurchaseorderitems.poordertotalper - tblpurchaseorderitems.poordertaxper),
              (tblpurchaseorderitems.poorderquant - tblpurchaseorderitems.poorderrcvdquant)) s1(priceeachlesstax, podiff);
  SQL
  create_view "qrypreorderpohistau2", sql_definition: <<-SQL
      SELECT qrypreorderpohistau.podate,
      qrypreorderpohistau.skuid,
      qrypreorderpohistau.splrid2,
      qrypreorderpohistau.splrname,
      qrypreorderpohistau.poorderquant,
      qrypreorderpohistau.poorderrcvdquant,
      qrypreorderpohistau.podiff,
      qrypreorderpohistau.poorderpriceper,
      qrypreorderpohistau.priceeachlesstax,
      qrypreorderpohistau.poid,
      sum(tblorderitems.orderquant) AS sumoforderquant,
      sum(tblorderitems.orderdeliveredquant) AS sumoforderdeliveredquant,
      qrypreorderpohistau.poorderexpiration
     FROM (tblorderitems
       RIGHT JOIN qrypreorderpohistau ON (((tblorderitems.skuid = qrypreorderpohistau.skuid) AND (tblorderitems.poid = qrypreorderpohistau.poid))))
    GROUP BY qrypreorderpohistau.podate, qrypreorderpohistau.skuid, qrypreorderpohistau.splrid2, qrypreorderpohistau.splrname, qrypreorderpohistau.poorderquant, qrypreorderpohistau.poorderrcvdquant, qrypreorderpohistau.podiff, qrypreorderpohistau.poorderpriceper, qrypreorderpohistau.priceeachlesstax, qrypreorderpohistau.poid, qrypreorderpohistau.poorderexpiration;
  SQL
  create_view "qrypreordersublist", sql_definition: <<-SQL
      SELECT tblpreorderitems.skuid1,
      tblpreorderitems.skuid2,
      tblcustomer.custname
     FROM ((tblpreorderitems
       JOIN tblpreorder ON ((tblpreorderitems.preorderid = tblpreorder.preorderid)))
       JOIN tblcustomer ON ((tblpreorder.custid = tblcustomer.custid)))
    GROUP BY tblpreorderitems.skuid1, tblpreorderitems.skuid2, tblcustomer.custname, tblpreorder.custid
   HAVING (tblpreorderitems.skuid2 <> 0);
  SQL
  create_view "qryskupohistau2", sql_definition: <<-SQL
      SELECT qryskupohistau.podate,
      qryskupohistau.skuid,
      qryskupohistau.splrid2,
      qryskupohistau.splrname,
      qryskupohistau.poorderquant,
      qryskupohistau.poorderrcvdquant,
      qryskupohistau.podiff,
      qryskupohistau.poorderpriceper,
      qryskupohistau.priceeachlesstax,
      qryskupohistau.poid,
      sum(tblorderitems.orderquant) AS sumoforderquant,
      sum(tblorderitems.orderdeliveredquant) AS sumoforderdeliveredquant,
      (qryskupohistau.poorderquant - COALESCE(sum(tblorderitems.orderquant), (0)::bigint)) AS available,
      (qryskupohistau.poorderrcvdquant - COALESCE(sum(tblorderitems.orderdeliveredquant), (0)::bigint)) AS in_dc,
      qryskupohistau.poorderexpiration
     FROM (qryskupohistau
       LEFT JOIN tblorderitems ON (((qryskupohistau.poid = tblorderitems.poid) AND (qryskupohistau.skuid = tblorderitems.skuid))))
    GROUP BY qryskupohistau.podate, qryskupohistau.skuid, qryskupohistau.splrid2, qryskupohistau.splrname, qryskupohistau.poorderquant, qryskupohistau.poorderrcvdquant, qryskupohistau.podiff, qryskupohistau.poorderpriceper, qryskupohistau.priceeachlesstax, qryskupohistau.poid, qryskupohistau.poorderexpiration;
  SQL
  create_view "sku_export", sql_definition: <<-SQL
      SELECT t.skuid,
      t.manf,
      t.itemno,
      t.skudesc,
      0 AS avail,
      '0'::text AS "DC_Ord",
      0 AS intransit,
      ic.dccurquant AS dccur,
      ic.bought,
      ic.sold,
      t.dcloc,
      tblskuclass.skuclassdesc AS sku_class,
      t.skuclassid AS classid,
      t.categoryid,
      ic.totalcases AS totalpurchcases,
      ic.totalcasesrcvd AS totalrcvdcases,
      t.skuminunits,
      t.skuminunitstype,
      t.skuminpercs,
      t.unitweight,
      t.sku,
      concat_ws('_'::text, ((t.vsku01)::text || (v01.vendorabbr)::text), ((t.vsku02)::text || (v02.vendorabbr)::text), ((t.vsku03)::text || (v03.vendorabbr)::text), ((t.vsku04)::text || (v04.vendorabbr)::text), ((t.vsku05)::text || (v05.vendorabbr)::text), ((t.vsku06)::text || (v06.vendorabbr)::text), ((t.vsku07)::text || (v07.vendorabbr)::text), ((t.vsku08)::text || (v08.vendorabbr)::text), ((t.vsku09)::text || (v09.vendorabbr)::text), ((t.vsku10)::text || (v10.vendorabbr)::text)) AS vskuconcat,
      t.skumaxtemp AS maxtemp,
      t.skumintemp AS mintemp
     FROM ((((((((((((tblsku t
       LEFT JOIN tblvendor v01 ON ((v01.vendorid = t.vno01)))
       LEFT JOIN tblvendor v02 ON ((v02.vendorid = t.vno02)))
       LEFT JOIN tblvendor v03 ON ((v03.vendorid = t.vno03)))
       LEFT JOIN tblvendor v04 ON ((v04.vendorid = t.vno04)))
       LEFT JOIN tblvendor v05 ON ((v05.vendorid = t.vno05)))
       LEFT JOIN tblvendor v06 ON ((v06.vendorid = t.vno06)))
       LEFT JOIN tblvendor v07 ON ((v07.vendorid = t.vno07)))
       LEFT JOIN tblvendor v08 ON ((v08.vendorid = t.vno08)))
       LEFT JOIN tblvendor v09 ON ((v09.vendorid = t.vno09)))
       LEFT JOIN tblvendor v10 ON ((v10.vendorid = t.vno10)))
       LEFT JOIN tblskuclass ON ((t.skuclassid = tblskuclass.skuclassid)))
       LEFT JOIN qryinventorycounts ic ON ((t.skuid = ic.skuid)));
  SQL
  create_view "sku_with_vskuconcats", sql_definition: <<-SQL
      SELECT concat_ws('_'::text, ((t.vsku01)::text || (v01.vendorabbr)::text), ((t.vsku02)::text || (v02.vendorabbr)::text), ((t.vsku03)::text || (v03.vendorabbr)::text), ((t.vsku04)::text || (v04.vendorabbr)::text), ((t.vsku05)::text || (v05.vendorabbr)::text), ((t.vsku06)::text || (v06.vendorabbr)::text), ((t.vsku07)::text || (v07.vendorabbr)::text), ((t.vsku08)::text || (v08.vendorabbr)::text), ((t.vsku09)::text || (v09.vendorabbr)::text), ((t.vsku10)::text || (v10.vendorabbr)::text)) AS vskuconcat,
      t.skuid,
      t.sku,
      t.manf,
      t.itemno,
      t.skudesc,
      t.unitweight,
      t.categoryid,
      t.skuminunits,
      t.skuminunitstype,
      t.dcloc,
      t.skuminpercs,
      t.vno01,
      t.vsku01,
      t.vhl01,
      t.vno02,
      t.vsku02,
      t.vhl02,
      t.vno03,
      t.vsku03,
      t.vhl03,
      t.vno04,
      t.vsku04,
      t.vhl04,
      t.vno05,
      t.vsku05,
      t.vhl05,
      t.vno06,
      t.vsku06,
      t.vhl06,
      t.vno07,
      t.vsku07,
      t.vhl07,
      t.vno08,
      t.vsku08,
      t.vhl08,
      t.vno09,
      t.vsku09,
      t.vhl09,
      t.vno10,
      t.vsku10,
      t.vhl10,
      t.skuhighprice,
      t.skuhighpricevno,
      t.skuhighpricedate,
      t.skuclassid,
      t.skumaxtemp,
      t.skumintemp,
      t.skunotes,
      t.tsv
     FROM ((((((((((tblsku t
       LEFT JOIN tblvendor v01 ON ((v01.vendorid = t.vno01)))
       LEFT JOIN tblvendor v02 ON ((v02.vendorid = t.vno02)))
       LEFT JOIN tblvendor v03 ON ((v03.vendorid = t.vno03)))
       LEFT JOIN tblvendor v04 ON ((v04.vendorid = t.vno04)))
       LEFT JOIN tblvendor v05 ON ((v05.vendorid = t.vno05)))
       LEFT JOIN tblvendor v06 ON ((v06.vendorid = t.vno06)))
       LEFT JOIN tblvendor v07 ON ((v07.vendorid = t.vno07)))
       LEFT JOIN tblvendor v08 ON ((v07.vendorid = t.vno08)))
       LEFT JOIN tblvendor v09 ON ((v07.vendorid = t.vno09)))
       LEFT JOIN tblvendor v10 ON ((v07.vendorid = t.vno10)));
  SQL
  create_view "qry_order_data_pick_list", sql_definition: <<-SQL
      SELECT tblcustomer.custid,
      tblcustomer.custname,
      tblcustomer.custfirst,
      tblcustomer.custlast,
      tblcustomer.custsal,
      tblcustomer.custtitle,
      tblcustomer.custbusinessname,
      tblcustomer.custaddress,
      tblcustomer.custcity,
      tblcustomer.custst,
      tblcustomer.custzip,
      tblcustomer.custprimarycontact1,
      tblcustomer.custphone1,
      tblcustomer.custphonetype1,
      tblcustomer.custemail1,
      tblcustomer.custprimarycontact2,
      tblcustomer.custphone2,
      tblcustomer.custphonetype2,
      tblcustomer.custemail2,
      tblcustomer.custfax,
      tblcustomer.custtaxrate,
      tblcustomer.custccauth,
      tblcustomer.custcclast4,
      tblorder.orderid,
      tblorder.orderdate,
      tblorder.orderbatch,
      tblorder.ordertaxrate,
      tblorder.ordernotes,
      tblorder.preordercompletedate,
      tblorderitems.orderitemsid,
      tblorderitems.poid,
      tblorderitems.orderdeliverycosttotal,
      tblorderitems.ordertaxtotal,
      tblorderitems.ordergrandtotal,
      tblorderitems.orderquant,
      tblorderitems.orderpriceper,
      tblorderitems.orderpricetotal,
      tblorderitems.orderretailtotal,
      tblorderitems.orderitemsdelivereddate,
      tblorderitems.orderdeliveredquant,
      tblsku.skuid,
      tblsku.sku,
      tblsku.manf,
      tblsku.itemno,
      tblsku.skudesc,
      tblsku.unitweight,
      tblsku.categoryid,
      tblsku.skuminunits,
      tblsku.skuminunitstype,
      tblsku.dcloc,
      tblsku.skuminpercs,
      tblsku.has_issue,
      s1.orderquantdue
     FROM (((tblsku
       JOIN tblorderitems ON ((tblorderitems.skuid = tblsku.skuid)))
       JOIN tblorder ON ((tblorder.orderid = tblorderitems.orderid)))
       JOIN tblcustomer ON ((tblcustomer.custid = tblorder.custid))),
      LATERAL ( SELECT (tblorderitems.orderquant - tblorderitems.orderdeliveredquant)) s1(orderquantdue)
    WHERE ((((tblsku.dcloc)::text <> 'N/A'::text) AND (s1.orderquantdue <> 0) AND (tblsku.has_issue = false)) OR (s1.orderquantdue < 0));
  SQL
end
