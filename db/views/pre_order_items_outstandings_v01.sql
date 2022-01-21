SELECT
    tblPreOrderItems.SKUID2,
    tblPreOrder.PreOrderID,
    tblPreOrder.PreOrderDate,
    tblPreOrderItems.PreOrderItemsID,
    tblCustomer.CustBusinessName,
    tblSKU.Manf,
    tblSKU.ItemNo,
    tblSKU.SKUDesc,
    tblPreOrderItems.OrderAUPricePer,
    tblPreOrderItems.PreOrderNotes,
    tblPreOrderItems.OrderQuant2,
    update_dc_inventory_counts.DCCurQuant,
    update_dc_inventory_counts.TotalDue,
    tblPreOrderItems.OrderPricePer2,
    tblPreOrderItems.OrderPriceTotal2,
    tblPreOrderItems.PreOrderItemCode,
    tblPreOrderItems.POID,
    DCCurQuant + TotalDue AS Avail
FROM tblSKU
JOIN tblPreOrderItems ON tblSKU.SKUID = tblPreOrderItems.SKUID2
JOIN tblPreOrder ON tblPreOrderItems.PreOrderID = tblPreOrder.PreOrderID
JOIN tblCustomer ON tblPreOrder.CustID = tblCustomer.CustID
LEFT JOIN update_dc_inventory_counts ON tblSKU.SKUID = update_dc_inventory_counts.SKUID
WHERE tblPreOrderItems.PreOrderItemCode<4
  AND (tblPreOrderItems.POID = 0 OR tblPreOrderItems.POID ISNULL)
