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
sums AS (
SELECT CustID,
       CustName,
       date_trunc('month', orderdate)::date as month,
       array_agg ( DISTINCT preorderid ) preorders,
       array_agg ( DISTINCT orderid ) orders,
       array_agg ( DISTINCT preorderdate ) preorderdates,

       sum(orderpricetotal1)::numeric AS current_total,
       sum(orderpricetotal2)::numeric AS accelerate_total,
       sum(orderpricetotal1)::numeric - sum(orderpricetotal2)::numeric AS gross_savings


FROM margin_report
WHERE preordercodeid IN (1, 2, 3, 5, 6)
GROUP BY CustID, CustName, date_trunc('month', orderdate)
),
quals AS (
  SELECT *,
  least(gross_savings, 499.0) AS tier1_qual,

  CASE WHEN gross_savings >= 499
    THEN least(1000, gross_savings - 499) ELSE 0
  END AS tier2_qual,

  CASE WHEN gross_savings >= 1500
    THEN gross_savings - 1500 ELSE 0
  END AS tier3_qual

  FROM sums
),
amts AS (
  SELECT *,
  tier1_qual * 1.0 AS tier1_amt,
  tier2_qual * 0.5 AS tier2_amt,
  tier3_qual * 0.1 AS tier3_amt
  FROM quals
),
totals AS (
  SELECT *,
  tier1_amt + tier2_amt + tier3_amt as total_fee
  from amts
)

SELECT
       coalesce(t.CustID, r.CustID) as custid,
       coalesce(t.CustName, r.CustName) as CustName,
       coalesce(t.month, r.month) as month,
       preorders,
       orders,
       current_total,
       accelerate_total,
       gross_savings,

       tier1_qual,
       tier2_qual,
       tier3_qual,

       tier1_amt,
       tier2_amt,
       tier3_amt,

       total_fee,

       accelerate_total + total_fee as invoice_net,
       gross_savings - total_fee as net_savings,

       return_orders,
       total_returns

FROM       totals t
FULL JOIN  returns r
USING(custid, month)
