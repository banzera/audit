PDFKit.configure do |config|
  # config.wkhtmltopdf = '/path/to/wkhtmltopdf'
  # config.default_options = {
  #   :page_size => 'Legal',
  #   :print_media_type => true
  # }
  # # Use only if your external hostname is unavailable on the server.
  config.verbose  = ENV['VERBOSE_PDFKIT'].present?
  app_host        = ENV['APPLICATION_HOST']
  config.root_url = "https://#{app_host}" if app_host
end
