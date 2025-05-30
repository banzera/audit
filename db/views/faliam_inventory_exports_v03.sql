with h as (
  SELECT
    pohist.skuid,
    max(priceeachlesstax) as price,
    max(dccurquant) as current_qty,
    max(dcloc) as dcloc
FROM qryskupohistau2 pohist
JOIN qryinventorycounts ic using(skuid)
WHERE ic.dccurquant > 0
GROUP BY pohist.skuid
)

select
'Accelerate Supply' as "Provider",
skuid as "Provider SKU",
'' as "Title",
'' as "Product",
'' as "PageURL",
manf as "Manufacturer",
itemno as "Manufacturer Sku",
skuclassdesc as "Category",
'' as "Subcategory",
'' as "Images (URLs)",
skuminunitstype as "UOM",
skuminunits as "Conversion Factor",
skudesc as "Description",
round((h.price * 1.2)::numeric, 2) as "Rate",
h.current_qty as "Current Qty",
h.dcloc as "DC Location"

from tblsku t
join h using (skuid)
join tblskuclass c using (skuclassid)
