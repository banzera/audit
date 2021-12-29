--qryOrderCCBillDue
CREATE OR REPLACE VIEW qryOrderCCBillDue AS

SELECT tblOrder.OrderID,
       tblOrder.OrderDate,
       tblOrder.OrderBatch,
       tblOrder.CustID,
       tblOrder.OrderTaxRate,
       tblOrder.OrderDeliveredDate,
       tblOrder.OrderDeliverdFrom,
       tblOrder.OrderDeliveredTo,
       tblOrder.OrderShipMethod,
       tblOrder.OrderReceiptHL,
       tblOrder.OrderDateInvoiced,
       tblOrder.OrderDatePaid,
       tblOrder.OrderPaymentMethod,
       tblOrder.OrderPaymentAmount,
       tblOrder.OrderNotes,
       tblOrder.OrderCCDate,
       tblCustomer.CustCCAuth,
       tblCustomer.CustBusinessName
FROM tblCustomer
INNER JOIN tblOrder ON tblCustomer.CustID = tblOrder.CustID
WHERE tblOrder.OrderDeliveredDate NOTNULL
  AND tblOrder.OrderDatePaid ISNULL
  AND tblOrder.OrderCCDate ISNULL
  AND tblCustomer.CustCCAuth = true;
