WITH

qryUpdateDCOrderInventoryCounts AS (
SELECT tblSKU.SKUID,
       SUM(tblOrderItems.OrderQuant)          AS OrdQuant,
       SUM(tblOrderItems.OrderDeliveredQuant) AS OrdDelQuant
FROM tblSKU
INNER JOIN tblOrderItems ON tblSKU.SKUID = tblOrderItems.SKUID
GROUP BY tblSKU.SKUID
),

qryUpdateDCPOInventoryCounts AS (
SELECT tblSKU.SKUID,
       SUM(tblPurchaseOrderItems.POOrderQuant)     AS POTotal,
       SUM(tblPurchaseOrderItems.POOrderRcvdQuant) AS POTotalRcvd
FROM tblSKU
INNER JOIN tblPurchaseOrderItems ON tblSKU.SKUID = tblPurchaseOrderItems.SKUID
GROUP BY tblSKU.SKUID
)

SELECT
  qryUpdateDCPOInventoryCounts.SKUID,
  total,
  TotalRcvd,
  DCCurQuant,
  Total * tblSKU.SKUMinUnits AS TotalUnits,
  Total / tblSKU.SKUMinPerCS AS TotalCases,
  tblSKU.SKUMinPerCS,
  TotalRcvd * tblSKU.SKUMinUnits AS TotalUnitsRcvd,
  TotalRcvd / tblSKU.SKUMinPerCS AS TotalCasesRcvd,
  Total - TotalRcvd AS TotalDue,
  COALESCE(qryUpdateDCOrderInventoryCounts.OrdQuant, 0) AS Sold,
  COALESCE(qryUpdateDCPOInventoryCounts.POTotal,     0) AS Bought
FROM tblSKU
JOIN qryUpdateDCPOInventoryCounts         ON tblsku.skuid = qryUpdateDCPOInventoryCounts.SKUID
LEFT JOIN qryUpdateDCOrderInventoryCounts ON tblsku.skuid = qryUpdateDCOrderInventoryCounts.SKUID
,
 LATERAL(
    SELECT
      qryUpdateDCPOInventoryCounts.POTotal     - COALESCE(qryUpdateDCOrderInventoryCounts.OrdQuant, 0),
      qryUpdateDCPOInventoryCounts.POTotalRcvd - COALESCE(qryUpdateDCOrderInventoryCounts.OrdQuant, 0),
      qryUpdateDCPOInventoryCounts.POTotalRcvd - COALESCE(qryUpdateDCOrderInventoryCounts.OrdDelQuant, 0)
    ) AS s1(total, TotalRcvd, DCCurQuant)
