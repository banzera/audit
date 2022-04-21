SELECT


  t.SKUID,
  t.Manf,
  t.ItemNo,
  t.SKUDesc,
  0 as Avail,
  '0' as "DC_Ord",
  0 as InTransit,
  ic.dccurquant as DCCur,
  ic.Bought,
  ic.Sold,
  t.DCLoc,
  tblSKUClass.SKUClassDesc as sku_class,
  t.SKUClassID as ClassID,
  t.CategoryID,
  ic.totalcases     as TotalPurchCases,
  ic.totalcasesrcvd as TotalRcvdCases,
  t.SKUMinUnits,
  t.SKUMinUnitsType,
  t.SKUMinPerCS,
  t.UnitWeight,
  t.SKU,
  concat_ws('_',
    t.vsku01 || v01.vendorabbr,
    t.vsku02 || v02.vendorabbr,
    t.vsku03 || v03.vendorabbr,
    t.vsku04 || v04.vendorabbr,
    t.vsku05 || v05.vendorabbr,
    t.vsku06 || v06.vendorabbr,
    t.vsku07 || v07.vendorabbr,
    t.vsku08 || v08.vendorabbr,
    t.vsku09 || v09.vendorabbr,
    t.vsku10 || v10.vendorabbr
  ) as vskuconcat,

  t.skumaxtemp as MaxTemp,
  t.skumintemp as MinTemp

FROM tblsku t
LEFT JOIN tblvendor v01 ON v01.vendorid = t.vno01
LEFT JOIN tblvendor v02 ON v02.vendorid = t.vno02
LEFT JOIN tblvendor v03 ON v03.vendorid = t.vno03
LEFT JOIN tblvendor v04 ON v04.vendorid = t.vno04
LEFT JOIN tblvendor v05 ON v05.vendorid = t.vno05
LEFT JOIN tblvendor v06 ON v06.vendorid = t.vno06
LEFT JOIN tblvendor v07 ON v07.vendorid = t.vno07
LEFT JOIN tblvendor v08 ON v08.vendorid = t.vno08
LEFT JOIN tblvendor v09 ON v09.vendorid = t.vno09
LEFT JOIN tblvendor v10 ON v10.vendorid = t.vno10
LEFT JOIN tblSKUClass   ON t.SKUClassID = tblSKUClass.SKUClassID
LEFT JOIN qryInventoryCounts ic ON t.skuid = ic.skuid



