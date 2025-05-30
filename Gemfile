source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

# Database
gem 'pg'
gem "pg_search", "~> 2.3"
gem "fx", "~> 0.6.2"
gem "scenic", "~> 1.5"

# Web Server
gem 'puma', '~> 5.0'

# Job Processing
gem "delayed_job", "~> 4.1"
gem "delayed_job_active_record", "~> 4.1"

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Better languages for templating/scripting
gem "haml-rails", "~> 2.0"
gem "coffee-rails", "~> 5.0"

# Easy resource tables
gem "effective_datatables", "~> 4.9", github: 'banzera/effective_datatables', branch: :master

# General application auditing
gem "effective_logging", "~> 3.2"

# Charting/reporting
gem "chartkick", "~> 4.1"
gem "groupdate", "~> 5.2"

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# PDF generation
gem 'pdfkit'
gem 'wkhtmltopdf-heroku', group: :production
gem "prawn-rails", "~> 1.4"
gem "prawn-svg"

# XLSX parsing/generating libraries
gem 'roo'
gem 'caxlsx'
gem 'caxlsx_rails'

# Barcodes
gem 'has_barcode'
gem 'rqrcode'

# Logging sanity
gem "lograge", "~> 0.11.2"
gem "colorize", "~> 0.8.1"

# Profiling and error reporting
gem 'rack-mini-profiler', '~> 2.0'

# Error reporting/perf monitoring
gem "sentry-ruby"
gem "sentry-rails"

# Better console
gem "pry-rails", "~> 0.3.9"

# consistent page titles
gem "flutie", "~> 2.2"

# iconography
gem "font-awesome-rails", "~> 4.7"

# Easy form creation
gem "simple_form", "~> 5.1"
gem "american_date", "~> 1.1"

# AuthN/AuthZ
gem "devise", "~> 4.8"
gem "cancancan", "~> 3.3"

# Reduces boot times through caching; required in config/boot.rb

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'bootsnap', '>= 1.4.4', require: false

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'

  gem "better_errors", "~> 2.9"
  gem "binding_of_caller", "~> 1.0"

  gem "pry-byebug", "~> 3.9"

  gem "rails_real_favicon"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "down", "~> 5.2"
gem "zippy", "~> 0.2.3"

gem "stimulus-rails", "~> 1.0"

gem "view_component", "~> 2.52"

gem "paper_trail", "~> 12.3"

gem "effective_addresses", "~> 1.9"

gem "seedbank", "~> 0.5.0"

gem "blazer", "~> 2.5"

gem "dry-initializer", "~> 3.1"

gem "matrix", "~> 0.4.2"
