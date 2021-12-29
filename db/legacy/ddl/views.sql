-- Create views

-- for billing cc due
  \i db/legacy/queries/qryOrderCCBillDue.sql
  \i db/legacy/queries/qryOrderDataShippingList2.sql

-- for sku form
  \i db/legacy/queries/qryInventoryCounts.sql
  \i db/legacy/queries/qryInventoryCountsFilter.sql

  -- dependency of subform 3
  \i db/legacy/queries/qrySKUOrderHistoryUnion.sql

  \i db/legacy/queries/frm_sku_subform1.sql
  -- subform2 is backed by tblSKU
  \i db/legacy/queries/frm_sku_subform3.sql

   -- used by subform4
  \i db/legacy/queries/qrySKUPOHistAU.sql
  -- used by subform5
  \i db/legacy/queries/qrySKUPOHistAU2.sql

  -- used by frmSKUCustInfoSubform1
  \i db/legacy/queries/frm_SKU_Cust_Info_Subform1.sql

  -- used by frmSKUCustInfoSubform2
  \i db/legacy/queries/frm_SKU_Cust_Info_Subform2.sql

-- for orders outstanding report
  \i db/legacy/queries/qry_order_items_outstanding.sql

-- for orders pick list
  \i db/legacy/queries/qry_order_data_pick_list.sql

-- for preorder form
  -- for subform1
  \i db/legacy/queries/frm_preorder_subform1.sql

  -- for subform2
  \i db/legacy/queries/frm_preorder_subform2.sql

  -- for subform3
  \i db/legacy/queries/frm_preorder_subform3.sql

  -- for subform4
  \i db/legacy/queries/frm_preorder_subform4.sql

  -- for subform4
  \i db/legacy/queries/frm_preorder_subform5.sql

  -- dep of subform 6
  \i db/legacy/queries/qryPreOrderHistoryUnion.sql

  -- for subform6 AND for subform8
  \i db/legacy/queries/frm_preorder_subform6.sql

  -- dependency of qryPreOrderPOHistAU2
  \i db/legacy/queries/qryPreOrderPOHistAU.sql

  -- for subform7
  \i db/legacy/queries/qryPreOrderPOHistAU2.sql

  -- for subform8
  \i db/legacy/queries/qryPreOrderSubList.sql

