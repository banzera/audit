WITH
returns AS (
SELECT c.CustID,
       CustName,
       date_trunc('month', orderdate)::date as month,
       array_agg ( DISTINCT oi.orderid ) return_orders,
       sum(orderpricetotal)::numeric AS total_returns

FROM tblorderitems oi
JOIN tblorder o using (orderid)
JOIN tblcustomer c using (custid)
WHERE ordergrandtotal < 0
GROUP BY c.CustID, CustName, date_trunc('month', orderdate)
ORDER BY date_trunc('month', orderdate)
),
fees AS (
SELECT CustID,
       subscription_amount
FROM tblcustomer
),
sums AS (
SELECT mr.CustID,
       CustName,
       date_trunc('month', orderdate)::date as month,
       array_agg ( DISTINCT preorderid ) preorders,
       array_agg ( DISTINCT orderid ) orders,
       array_agg ( DISTINCT preorderdate ) preorderdates,

       sum(orderpricetotal1)::numeric AS current_total,
       sum(orderpricetotal2)::numeric AS accelerate_total,
       sum(orderpricetotal1)::numeric - sum(orderpricetotal2)::numeric AS gross_savings

FROM margin_report mr
WHERE preordercodeid IN (1, 2, 3, 5, 6)
GROUP BY mr.CustID, CustName, date_trunc('month', orderdate)
)

SELECT
       coalesce(t.CustID, r.CustID) as custid,
       coalesce(t.CustName, r.CustName) as CustName,
       coalesce(t.month, r.month) as month,
       preorders,
       orders,
       current_total,
       accelerate_total,
       coalesce(gross_savings, 0) as gross_savings,

       return_orders,
       total_returns,

       subscription_amount,

       coalesce(accelerate_total, 0) -
       coalesce(total_returns, 0) +
       coalesce(subscription_amount,0) AS invoice_total

FROM       sums t
JOIN       fees f    USING(CustID)
FULL JOIN  returns r USING(custid, month)
;
