-- qryOrderCCDateUpdate

UPDATE tblOrder SET tblOrder.OrderCCDate = Date()
WHERE (((tblOrder.OrderID)=[Forms]![frmOrder]![txtOrderID]));
