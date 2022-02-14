namespace :sku do
  desc "Update DC location for out-of-stock SKUs"
  task :update_na => :environment do
    SkuLocationService.update_na
  end
end
