CREATE OR REPLACE VIEW qry_order_data_pick_list AS

SELECT tblCustomer.CustID, tblCustomer.CustName, tblCustomer.CustFIrst, tblCustomer.CustLast, tblCustomer.CustSal, tblCustomer.CustTitle,
       tblCustomer.CustBusinessName, tblCustomer.CustAddress, tblCustomer.CustCity, tblCustomer.CustSt, tblCustomer.CustZip,
       tblCustomer.CustPrimaryContact1, tblCustomer.CustPhone1, tblCustomer.CustPhoneType1, tblCustomer.CustEmail1, tblCustomer.CustPrimaryContact2,
       tblCustomer.CustPhone2, tblCustomer.CustPhoneType2, tblCustomer.CustEmail2, tblCustomer.CustFax, tblCustomer.CustTaxRate,
       tblCustomer.CustCCAuth,
       tblCustomer.CustCCLast4,


       tblOrder.OrderID, tblOrder.OrderDate, tblOrder.OrderBatch,
       -- tblOrder.CustID,
       tblOrder.OrderTaxRate, tblOrder.OrderNotes,
       tblOrder.PreOrderCompleteDate,

       tblOrderItems.OrderItemsID,
       -- tblOrderItems.SKUID,
       tblOrderItems.POID, tblOrderItems.OrderDeliveryCostTotal, tblOrderItems.OrderTaxTotal,
       tblOrderItems.OrderGrandTotal, tblOrderItems.OrderQuant, tblOrderItems.OrderPricePer, tblOrderItems.OrderPriceTotal,
       tblOrderItems.OrderRetailTotal, tblOrderItems.OrderItemsDeliveredDate, tblOrderItems.OrderDeliveredQuant,

       tblSKU.SKUID, tblSKU.SKU, tblSKU.Manf, tblSKU.ItemNo, tblSKU.SKUDesc, tblSKU.UnitWeight, tblSKU.CategoryID,
       tblSKU.SKUMinUnits, tblSKU.SKUMinUnitsType, tblSKU.DCLoc, tblSKU.SKUMinPerCS,

       OrderQuantDue
FROM tblSKU
INNER JOIN tblOrderItems ON tblOrderItems.SKUID = tblSKU.SKUID
INNER JOIN tblOrder      ON tblOrder.OrderID    = tblOrderItems.OrderID
INNER JOIN tblCustomer   ON tblCustomer.CustID  = tblOrder.CustID,
LATERAL(
  SELECT tblOrderItems.OrderQuant - tblOrderItems.OrderDeliveredQuant
) AS s1(OrderQuantDue)
WHERE (tblSKU.DCLoc != 'N/A' AND (OrderQuantDue <> 0))
   OR (OrderQuantDue <  0)
;
--WHERE tblOrder.OrderID = ?orderid
