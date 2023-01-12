SELECT
  tblCustomer.CustID,
  tblCustomer.CustName,
  tblCustomer.CustFIrst,
  tblCustomer.CustLast,
  tblCustomer.CustSal,
  tblCustomer.CustTitle,
  tblCustomer.CustBusinessName,
  tblCustomer.CustAddress,
  tblCustomer.CustCity,
  tblCustomer.CustSt,
  tblCustomer.CustZip,
  tblCustomer.CustPrimaryContact1,
  tblCustomer.CustPhone1,
  tblCustomer.CustPhoneType1,
  tblCustomer.CustEmail1,
  tblCustomer.CustPrimaryContact2,
  tblCustomer.CustPhone2,
  tblCustomer.CustPhoneType2,
  tblCustomer.CustEmail2,
  tblCustomer.CustFax,
  tblCustomer.CustTaxRate,
  tblCustomer.CustCCAuth,
  tblCustomer.CustCCLast4,

  tblPreOrder.PreOrderID,
  tblPreOrder.PreOrderDate,
  tblPreOrder.PreOrderBatch,
  -- tblPreOrder.CustID,
  tblPreOrder.PreOrderNotes,
  tblPreOrder.OrderID,

  tblOrder.orderdate,
  tblOrder.orderbatch,
  tblOrder.orderccdate,
  tblOrder.orderconfirmdate,

  tblPreOrderItems.PreOrderItemsID,
  tblPreOrderItems.POID,
  tblPreOrderItems.SKUID1,
  tblPreOrderItems.SKUID2,
  tblPreOrderItems.OrderQuant1,
  tblPreOrderItems.OrderQuant2,
  tblPreOrderItems.OrderPricePer1,
  tblPreOrderItems.OrderPricePer2,
  tblPreOrderItems.OrderPriceTotal1,
  tblPreOrderItems.OrderPriceTotal2,
  tblPreOrderItems.OrderAUPricePer,
  -- tblPreOrderItems.PreOrderItemCode,

  sku1.SKU,
  sku1.Manf,
  sku1.ItemNo,
  sku1.SKUDesc,

  sku2.SKU as SKU2,
  sku2.Manf as Manf2,
  sku2.ItemNo AS ItemNo2,
  sku2.SKUDesc AS SKUDesc2,

  tblPreOrderCodes.PreOrderCodeID,
  tblPreOrderCodes.PreOrderCode,
  tblPreOrderCodes.PreOrderCodeDesc

FROM tblPreOrderItems
JOIN tblSKU AS sku1   ON sku1.SKUID = tblPreOrderItems.SKUID1
JOIN tblSKU AS sku2   ON sku2.SKUID = tblPreOrderItems.SKUID2
JOIN tblPreOrderCodes ON tblPreOrderCodes.PreOrderCodeID = tblPreOrderItems.PreOrderItemCode
JOIN tblPreOrder      ON tblPreOrder.PreOrderID = tblPreOrderItems.PreOrderID
JOIN tblOrder         ON tblOrder.OrderID   = tblPreOrder.OrderID
JOIN tblCustomer      ON tblCustomer.CustID = tblPreOrder.CustID
