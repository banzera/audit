class SkuLocationService

  def self.update_na
    log = EffectiveLogger.info 'Updating DC location for out-of-stock SKUs'

    # skus with no inventory but marked with a location
    skuids = InventoryCounts.no_stock.has_location.pluck(:skuid)

    count = Sku.where(skuid: skuids).update_all(dcloc: Sku::DC_LOC_NONE)
    log.success("updated #{count} SKUs", :ids => skuids)
  end

end
