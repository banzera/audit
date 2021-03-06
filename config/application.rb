require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Audit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("lib")

    config.middleware.use PDFKit::Middleware, {}, :except => [%r[^/purchase_order_items]]

    # 404 catch all route
    config.after_initialize do |app|
      # must reload routes or doesn't work in Rails.env.development?
      Rails.application.reload_routes!

      app.routes.append do
        match "*bad_routes", :to => "application#not_found", :via => :all
      end
    end
  end
end
