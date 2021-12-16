-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE "AUDITClassUpdate201121"
 (
	"SKUID"			DOUBLE PRECISION, 
	"ClassID"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
CREATE INDEX "AUDITClassUpdate201121_ClassID_idx" ON "AUDITClassUpdate201121" ("ClassID");
CREATE INDEX "AUDITClassUpdate201121_SKUID_idx" ON "AUDITClassUpdate201121" ("SKUID");

CREATE TABLE "AUShelfUpdate210703"
 (
	"Old"			VARCHAR (255), 
	"New"			VARCHAR (255)
);

-- CREATE INDEXES ...

CREATE TABLE "AUSKUImport 210325"
 (
	"SKU"			VARCHAR (255), 
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"CategoryID"			DOUBLE PRECISION, 
	"SKUMinUnits"			DOUBLE PRECISION, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			DOUBLE PRECISION, 
	"VNo01"			DOUBLE PRECISION, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE INDEX "AUSKUImport 210325_CategoryID_idx" ON "AUSKUImport 210325" ("CategoryID");

CREATE TABLE "AUSKUImport210227"
 (
	"SKUID"			DOUBLE PRECISION, 
	"SKU"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE INDEX "AUSKUImport210227_SKUID_idx" ON "AUSKUImport210227" ("SKUID");

CREATE TABLE "BencoSKUImport210227"
 (
	"SKU"			VARCHAR (255), 
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"CategoryID"			DOUBLE PRECISION, 
	"SKUMinUnits"			DOUBLE PRECISION, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			DOUBLE PRECISION, 
	"VNo01"			DOUBLE PRECISION, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			TEXT
);

-- CREATE INDEXES ...
CREATE INDEX "BencoSKUImport210227_CategoryID_idx" ON "BencoSKUImport210227" ("CategoryID");

CREATE TABLE "Error Fix 211122"
 (
	"SKUID"			DOUBLE PRECISION, 
	"SKUDesc"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE INDEX "Error Fix 211122_SKUID_idx" ON "Error Fix 211122" ("SKUID");

CREATE TABLE "HSPreImport"
 (
	"PreOrderID"			DOUBLE PRECISION, 
	"SKUID1"			DOUBLE PRECISION, 
	"OrderQuant1"			DOUBLE PRECISION, 
	"OrderPricePer1"			DOUBLE PRECISION, 
	"OrderPriceTotal1"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
CREATE INDEX "HSPreImport_PreOrderID_idx" ON "HSPreImport" ("PreOrderID");

CREATE TABLE "HSSKUImport201214"
 (
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"CategoryID"			DOUBLE PRECISION, 
	"SKUMinUnits"			DOUBLE PRECISION, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			DOUBLE PRECISION, 
	"VNo01"			DOUBLE PRECISION, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			TEXT
);

-- CREATE INDEXES ...
CREATE INDEX "HSSKUImport201214_CategoryID_idx" ON "HSSKUImport201214" ("CategoryID");

CREATE TABLE "PATSKUImport"
 (
	"SKU"			VARCHAR (255), 
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"CategoryID"			DOUBLE PRECISION, 
	"SKUMinUnits"			DOUBLE PRECISION, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			DOUBLE PRECISION, 
	"VNo01"			DOUBLE PRECISION, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE INDEX "PATSKUImport_CategoryID_idx" ON "PATSKUImport" ("CategoryID");

CREATE TABLE "PATVSKUImport201211"
 (
	"PATItem"			VARCHAR (255), 
	"AUSKU"			DOUBLE PRECISION, 
	"URL"			TEXT
);

-- CREATE INDEXES ...

CREATE TABLE "PATVSKUNewImport201211"
 (
	"Item"			VARCHAR (255), 
	"Trim"			VARCHAR (255), 
	"Check"			DOUBLE PRECISION, 
	"SKU"			VARCHAR (255), 
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"CategoryID"			DOUBLE PRECISION, 
	"SKUMinUnits"			DOUBLE PRECISION, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			DOUBLE PRECISION, 
	"VNo01"			DOUBLE PRECISION, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			TEXT
);

-- CREATE INDEXES ...
CREATE INDEX "PATVSKUNewImport201211_CategoryID_idx" ON "PATVSKUNewImport201211" ("CategoryID");

CREATE TABLE "PATVSKUNewImport2012112"
 (
	"Item"			VARCHAR (255), 
	"Trim"			VARCHAR (255), 
	"Check"			DOUBLE PRECISION, 
	"SKU"			VARCHAR (255), 
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"CategoryID"			DOUBLE PRECISION, 
	"SKUMinUnits"			DOUBLE PRECISION, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			DOUBLE PRECISION, 
	"VNo01"			DOUBLE PRECISION, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			TEXT
);

-- CREATE INDEXES ...
CREATE INDEX "PATVSKUNewImport2012112_CategoryID_idx" ON "PATVSKUNewImport2012112" ("CategoryID");

CREATE TABLE "POImport"
 (
	"SKUID"			DOUBLE PRECISION, 
	"POID"			DOUBLE PRECISION, 
	"POOrderQuant"			DOUBLE PRECISION, 
	"POOrderPrice"			DOUBLE PRECISION, 
	"POOrderTax"			DOUBLE PRECISION, 
	"POOrderShipping"			DOUBLE PRECISION, 
	"POOrderTotal"			DOUBLE PRECISION, 
	"POOrderPricePer"			DOUBLE PRECISION, 
	"POOrderTaxPer"			DOUBLE PRECISION, 
	"POOrderShippingPer"			DOUBLE PRECISION, 
	"POOrderTotalPer"			DOUBLE PRECISION, 
	"POOrderRebate"			BOOL NOT NULL DEFAULT FALSE, 
	"POOrderRebateNotes"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE INDEX "POImport_POID_idx" ON "POImport" ("POID");
CREATE INDEX "POImport_SKUID_idx" ON "POImport" ("SKUID");

CREATE TABLE "tblAnalysis"
 (
	"AnalysisID"			SERIAL, 
	"CustomerID"			INTEGER DEFAULT 0, 
	"AnalysisDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"StartAnalysisDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"EndAnalysisDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"AnalysisSplrID"			INTEGER DEFAULT 0
);

-- CREATE INDEXES ...
CREATE INDEX "tblAnalysis_AnalysisSPLRID_idx" ON "tblAnalysis" ("AnalysisSplrID");
CREATE INDEX "tblAnalysis_CustomerID_idx" ON "tblAnalysis" ("CustomerID");
ALTER TABLE "tblAnalysis" ADD CONSTRAINT "tblAnalysis_pkey" PRIMARY KEY ("AnalysisID");

CREATE TABLE "tblBank"
 (
	"BankID"			SERIAL, 
	"BankName"			VARCHAR (255), 
	"BankBusinessName"			VARCHAR (255), 
	"BankFIrst"			VARCHAR (255), 
	"BankLast"			VARCHAR (255), 
	"BankSal"			VARCHAR (255), 
	"BankTitle"			VARCHAR (255), 
	"BankAddress"			VARCHAR (255), 
	"BankCity"			VARCHAR (255), 
	"BankSt"			VARCHAR (255), 
	"BankZip"			VARCHAR (255), 
	"BankPhone"			VARCHAR (255), 
	"BankFax"			VARCHAR (255), 
	"BankEmail"			VARCHAR (255), 
	"BankPrimaryContact1"			VARCHAR (255), 
	"BankPhone1"			VARCHAR (255), 
	"BankPhoneType1"			VARCHAR (255), 
	"BankEmail1"			VARCHAR (255), 
	"BankPrimaryContact2"			VARCHAR (255), 
	"BankPhone2"			VARCHAR (255), 
	"BankPhoneType2"			VARCHAR (255), 
	"BankEmail2"			VARCHAR (255), 
	"BankAcctNo"			VARCHAR (255), 
	"BankAcctName"			VARCHAR (255), 
	"BankNotes"			TEXT, 
	"BankDateModified"			TIMESTAMP WITHOUT TIME ZONE
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tblBank_CustName_idx" ON "tblBank" ("BankName");
ALTER TABLE "tblBank" ADD CONSTRAINT "tblBank_pkey" PRIMARY KEY ("BankID");

CREATE TABLE "tblCategory"
 (
	"CategoryID"			SERIAL, 
	"CategoryDesc"			VARCHAR (255)
);

-- CREATE INDEXES ...
ALTER TABLE "tblCategory" ADD CONSTRAINT "tblCategory_pkey" PRIMARY KEY ("CategoryID");

CREATE TABLE "tblCustomer"
 (
	"CustID"			SERIAL, 
	"CustName"			VARCHAR (255), 
	"CustBusinessName"			VARCHAR (255), 
	"CustFIrst"			VARCHAR (255), 
	"CustLast"			VARCHAR (255), 
	"CustSal"			VARCHAR (255), 
	"CustTitle"			VARCHAR (255), 
	"CustAddress"			VARCHAR (255), 
	"CustCity"			VARCHAR (255), 
	"CustSt"			VARCHAR (255), 
	"CustZip"			VARCHAR (255), 
	"CustPhone"			VARCHAR (255), 
	"CustFax"			VARCHAR (255), 
	"CustEmail"			VARCHAR (255), 
	"CustPrimaryContact1"			VARCHAR (255), 
	"CustPhone1"			VARCHAR (255), 
	"CustPhoneType1"			VARCHAR (255), 
	"CustEmail1"			VARCHAR (255), 
	"CustPrimaryContact2"			VARCHAR (255), 
	"CustPhone2"			VARCHAR (255), 
	"CustPhoneType2"			VARCHAR (255), 
	"CustEmail2"			VARCHAR (255), 
	"CustTaxRate"			REAL DEFAULT 0, 
	"CustNotes"			TEXT, 
	"CustDateCreated"			TIMESTAMP WITHOUT TIME ZONE, 
	"CustDateModified"			TIMESTAMP WITHOUT TIME ZONE, 
	"CustBillingBusinessName"			VARCHAR (255), 
	"CustBillingFirst"			VARCHAR (255), 
	"CustBillingLast"			VARCHAR (255), 
	"CustBillingSal"			VARCHAR (255), 
	"CustBillingTitle"			VARCHAR (255), 
	"CustBillingAddress"			VARCHAR (255), 
	"CustBillingCity"			VARCHAR (255), 
	"CustBillingSt"			VARCHAR (255), 
	"CustBillingZip"			VARCHAR (255), 
	"CustBillingPhone"			VARCHAR (255), 
	"CustBillingFax"			VARCHAR (255), 
	"CustBillingEmail"			VARCHAR (255), 
	"CustBillingSame"			BOOL NOT NULL DEFAULT FALSE, 
	"CustQBO"			BOOL NOT NULL DEFAULT FALSE, 
	"CustCCAuth"			BOOL NOT NULL DEFAULT FALSE, 
	"CustCCLast4"			VARCHAR (255), 
	"CustTaxJurisID"			INTEGER DEFAULT 0, 
	"LastRewardDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"CustHSAcct"			VARCHAR (255), 
	"Discontinued"			BOOL NOT NULL DEFAULT FALSE, 
	"CustTYFirstName"			VARCHAR (255), 
	"CustTYLastName"			VARCHAR (255), 
	"CustTYAddress"			VARCHAR (255), 
	"CustTYCity"			VARCHAR (255), 
	"CustTYST"			VARCHAR (255), 
	"CustTYZip"			VARCHAR (255), 
	"CustTYPhone"			VARCHAR (255), 
	"CustTYEmail"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tblCustomer_CustName_idx" ON "tblCustomer" ("CustName");
ALTER TABLE "tblCustomer" ADD CONSTRAINT "tblCustomer_pkey" PRIMARY KEY ("CustID");

CREATE TABLE "tblDCLocUpdate"
 (
	"DCLocUpdateID"			SERIAL, 
	"UserName"			VARCHAR (255), 
	"SKUID"			INTEGER DEFAULT 0, 
	"TimeStampScanned"			VARCHAR (255), 
	"TimeStampRcvd"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255)
);

-- CREATE INDEXES ...
ALTER TABLE "tblDCLocUpdate" ADD CONSTRAINT "tblDCLocUpdate_pkey" PRIMARY KEY ("DCLocUpdateID");
CREATE INDEX "tblDCLocUpdate_SKUID_idx" ON "tblDCLocUpdate" ("SKUID");

CREATE TABLE "tblOrder"
 (
	"OrderID"			SERIAL, 
	"OrderDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"OrderBatch"			VARCHAR (255), 
	"CustID"			INTEGER DEFAULT 0, 
	"OrderTaxRate"			REAL DEFAULT 0, 
	"OrderDeliveredDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"OrderDeliverdFrom"			VARCHAR (255), 
	"OrderDeliveredTo"			VARCHAR (255), 
	"OrderShipMethod"			VARCHAR (255), 
	"OrderReceiptHL"			VARCHAR (255), 
	"OrderDateInvoiced"			TIMESTAMP WITHOUT TIME ZONE, 
	"OrderDatePaid"			TIMESTAMP WITHOUT TIME ZONE, 
	"OrderPaymentMethod"			VARCHAR (255), 
	"OrderPaymentAmount"			NUMERIC(15,2) DEFAULT 0, 
	"OrderNotes"			TEXT, 
	"OrderCCDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"PreOrderCompleteDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"OrderConfirmDate"			TIMESTAMP WITHOUT TIME ZONE
);

-- CREATE INDEXES ...
CREATE INDEX "tblOrder_CustID_idx" ON "tblOrder" ("CustID");
CREATE UNIQUE INDEX "tblOrder_OrderBatch_idx" ON "tblOrder" ("OrderBatch");
CREATE INDEX "tblOrder_OrderDatePaid_idx" ON "tblOrder" ("OrderDatePaid");
CREATE INDEX "tblOrder_OrderDtPaid_idx" ON "tblOrder" ("OrderDateInvoiced");
ALTER TABLE "tblOrder" ADD CONSTRAINT "tblOrder_pkey" PRIMARY KEY ("OrderID");

CREATE TABLE "tblOrderDeposit"
 (
	"ODepositID"			SERIAL, 
	"ODepositDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"ODepositBatch"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tblOrderDeposit_POBatch_idx" ON "tblOrderDeposit" ("ODepositBatch");
ALTER TABLE "tblOrderDeposit" ADD CONSTRAINT "tblOrderDeposit_pkey" PRIMARY KEY ("ODepositID");

CREATE TABLE "tblOrderPmts"
 (
	"OPmtsID"			SERIAL, 
	"OPmtsDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"OPmtsBatch"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tblOrderPmts_POBatch_idx" ON "tblOrderPmts" ("OPmtsBatch");
ALTER TABLE "tblOrderPmts" ADD CONSTRAINT "tblOrderPmts_pkey" PRIMARY KEY ("OPmtsID");

CREATE TABLE "tblOrderPmtsItems"
 (
	"OPmtsItemsID"			SERIAL, 
	"OPmtsID"			INTEGER DEFAULT 0, 
	"OrderItemsID"			INTEGER DEFAULT 0, 
	"OPmtsTotal"			NUMERIC(15,2) DEFAULT 0, 
	"ODepositID"			INTEGER DEFAULT 0
);

-- CREATE INDEXES ...
ALTER TABLE "tblOrderPmtsItems" ADD CONSTRAINT "tblOrderPmtsItems_pkey" PRIMARY KEY ("OPmtsItemsID");

CREATE TABLE "tblPercent"
 (
	"Percent"			DOUBLE PRECISION DEFAULT 0
);

-- CREATE INDEXES ...

CREATE TABLE "tblPreOrder"
 (
	"PreOrderID"			SERIAL, 
	"PreOrderDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"PreOrderBatch"			VARCHAR (255), 
	"CustID"			INTEGER DEFAULT 0, 
	"PreOrderNotes"			TEXT, 
	"PreOrderSH1"			NUMERIC(15,2) DEFAULT 0, 
	"PreOrderSH2"			NUMERIC(15,2) DEFAULT 0, 
	"PreOrderVendorID"			INTEGER DEFAULT 0, 
	"OrderID"			INTEGER DEFAULT 0, 
	"OrderCreateDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"PreOrderAnalysisDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"ConfirmationDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"PreOrderCheck"			TIMESTAMP WITHOUT TIME ZONE
);

-- CREATE INDEXES ...
CREATE INDEX "tblPreOrder_CustID_idx" ON "tblPreOrder" ("CustID");
CREATE UNIQUE INDEX "tblPreOrder_OrderBatch_idx" ON "tblPreOrder" ("PreOrderBatch");
CREATE INDEX "tblPreOrder_PreOrderVendorID_idx" ON "tblPreOrder" ("PreOrderVendorID");
ALTER TABLE "tblPreOrder" ADD CONSTRAINT "tblPreOrder_pkey" PRIMARY KEY ("PreOrderID");

CREATE TABLE "tblPreOrderCodes"
 (
	"PreOrderCodeID"			SERIAL, 
	"PreOrderCode"			VARCHAR (255), 
	"PreOrderCodeDesc"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE INDEX "tblPreOrderCodes_PreOrderCode_idx" ON "tblPreOrderCodes" ("PreOrderCode");
ALTER TABLE "tblPreOrderCodes" ADD CONSTRAINT "tblPreOrderCodes_pkey" PRIMARY KEY ("PreOrderCodeID");

CREATE TABLE "tblPreOrderItems"
 (
	"PreOrderItemsID"			SERIAL, 
	"PreOrderID"			INTEGER DEFAULT 0, 
	"POID"			INTEGER DEFAULT 0, 
	"SKUID1"			INTEGER DEFAULT 0, 
	"SKUID2"			INTEGER DEFAULT 0, 
	"OrderQuant1"			INTEGER DEFAULT 0, 
	"OrderQuant2"			INTEGER DEFAULT 0, 
	"OrderPricePer1"			NUMERIC(15,2) DEFAULT 0, 
	"OrderPricePer2"			NUMERIC(15,2) DEFAULT 0, 
	"OrderPriceTotal1"			NUMERIC(15,2) DEFAULT 0, 
	"OrderPriceTotal2"			NUMERIC(15,2) DEFAULT 0, 
	"OrderAUPricePer"			NUMERIC(15,2) DEFAULT 0, 
	"PreOrderItemCode"			INTEGER DEFAULT 0, 
	"OrderDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"PreOrderNotes"			TEXT, 
	"PreOrderUrgent"			BOOL NOT NULL DEFAULT FALSE
);

-- CREATE INDEXES ...
CREATE INDEX "tblPreOrderItems_PreOrderItemCode_idx" ON "tblPreOrderItems" ("PreOrderItemCode");
ALTER TABLE "tblPreOrderItems" ADD CONSTRAINT "tblPreOrderItems_pkey" PRIMARY KEY ("PreOrderItemsID");

CREATE TABLE "tblPurchaseOrderItems"
 (
	"POItemsID"			SERIAL, 
	"POID"			INTEGER DEFAULT 0, 
	"SKUID"			INTEGER DEFAULT 0, 
	"POOrderQuant"			INTEGER DEFAULT 0, 
	"POOrderPrice"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderTax"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderShipping"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderFees"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderTotal"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderPricePer"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderTaxPer"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderShippingPer"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderFeesPer"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderTotalPer"			NUMERIC(15,2) DEFAULT 0, 
	"POOrderRcvdDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"POOrderRcvdQuant"			INTEGER DEFAULT 0, 
	"POOrderExpiration"			TIMESTAMP WITHOUT TIME ZONE, 
	"POOrderRebateDeadline"			TIMESTAMP WITHOUT TIME ZONE, 
	"POOrderRebateSubmitted"			TIMESTAMP WITHOUT TIME ZONE, 
	"POOrderRebate"			BOOL NOT NULL DEFAULT FALSE, 
	"POOrderRebateNotes"			VARCHAR (255), 
	"POOrderSplit"			BOOL NOT NULL DEFAULT FALSE, 
	"POOrderIssue"			BOOL NOT NULL DEFAULT FALSE
);

-- CREATE INDEXES ...
ALTER TABLE "tblPurchaseOrderItems" ADD CONSTRAINT "tblPurchaseOrderItems_pkey" PRIMARY KEY ("POItemsID");

CREATE TABLE "tblPurchaseType"
 (
	"PurchaseTypeID"			SERIAL, 
	"PurchaseType"			VARCHAR (255)
);

-- CREATE INDEXES ...
ALTER TABLE "tblPurchaseType" ADD CONSTRAINT "tblPurchaseType_pkey" PRIMARY KEY ("PurchaseTypeID");

CREATE TABLE "tblShipper"
 (
	"ShipID"			SERIAL, 
	"ShipName"			VARCHAR (255), 
	"ShipFIrst"			VARCHAR (255), 
	"ShipLast"			VARCHAR (255), 
	"ShipBusinessName"			VARCHAR (255), 
	"ShipAddress"			VARCHAR (255), 
	"ShipCity"			VARCHAR (255), 
	"ShipSt"			VARCHAR (255), 
	"ShipZip"			VARCHAR (255), 
	"ShipPhone1"			VARCHAR (255), 
	"ShipPhone2"			VARCHAR (255), 
	"ShipFax"			VARCHAR (255), 
	"ShipEmail1"			VARCHAR (255), 
	"ShipEmail2"			VARCHAR (255), 
	"ShipPrimaryContact1"			VARCHAR (255), 
	"ShipPrimaryContact2"			VARCHAR (255)
);

-- CREATE INDEXES ...
ALTER TABLE "tblShipper" ADD CONSTRAINT "tblShipper_pkey" PRIMARY KEY ("ShipID");

CREATE TABLE "tblSKU"
 (
	"SKUID"			SERIAL, 
	"SKU"			VARCHAR (255), 
	"Manf"			VARCHAR (255), 
	"ItemNo"			VARCHAR (255), 
	"SKUDesc"			VARCHAR (255), 
	"UnitWeight"			VARCHAR (255), 
	"CategoryID"			INTEGER DEFAULT 0, 
	"SKUMinUnits"			INTEGER DEFAULT 0, 
	"SKUMinUnitsType"			VARCHAR (255), 
	"DCLoc"			VARCHAR (255), 
	"SKUMinPerCS"			INTEGER DEFAULT 0, 
	"VNo01"			INTEGER DEFAULT 0, 
	"VSKU01"			VARCHAR (255), 
	"VHL01"			TEXT, 
	"VNo02"			INTEGER DEFAULT 0, 
	"VSKU02"			VARCHAR (255), 
	"VHL02"			TEXT, 
	"VNo03"			INTEGER DEFAULT 0, 
	"VSKU03"			VARCHAR (255), 
	"VHL03"			TEXT, 
	"VNo04"			INTEGER DEFAULT 0, 
	"VSKU04"			VARCHAR (255), 
	"VHL04"			TEXT, 
	"VNo05"			INTEGER DEFAULT 0, 
	"VSKU05"			VARCHAR (255), 
	"VHL05"			TEXT, 
	"VNo06"			INTEGER DEFAULT 0, 
	"VSKU06"			VARCHAR (255), 
	"VHL06"			TEXT, 
	"VNo07"			INTEGER DEFAULT 0, 
	"VSKU07"			VARCHAR (255), 
	"VHL07"			TEXT, 
	"VNo08"			INTEGER DEFAULT 0, 
	"VSKU08"			VARCHAR (255), 
	"VHL08"			TEXT, 
	"VNo09"			INTEGER DEFAULT 0, 
	"VSKU09"			VARCHAR (255), 
	"VHL09"			TEXT, 
	"VNo10"			INTEGER DEFAULT 0, 
	"VSKU10"			VARCHAR (255), 
	"VHL10"			TEXT, 
	"SKUHighPrice"			NUMERIC(15,2) DEFAULT 0, 
	"SKUHighPriceVNo"			INTEGER DEFAULT 0, 
	"SKUHighPriceDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"SKUClassID"			INTEGER DEFAULT 0, 
	"SKUMaxTemp"			INTEGER DEFAULT 0, 
	"SKUMinTemp"			INTEGER DEFAULT 0, 
	"SKUNotes"			TEXT
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tblSKU_ItemNo_idx" ON "tblSKU" ("ItemNo");
ALTER TABLE "tblSKU" ADD CONSTRAINT "tblSKU_pkey" PRIMARY KEY ("SKUID");
CREATE UNIQUE INDEX "tblSKU_SKU_idx" ON "tblSKU" ("SKU");
CREATE INDEX "tblSKU_SKUClassID_idx" ON "tblSKU" ("SKUClassID");

CREATE TABLE "tblSKUClass"
 (
	"SKUClassID"			SERIAL, 
	"SKUClassDesc"			VARCHAR (255)
);

-- CREATE INDEXES ...
ALTER TABLE "tblSKUClass" ADD CONSTRAINT "tblSKUClass_pkey" PRIMARY KEY ("SKUClassID");

CREATE TABLE "tblSKUCustInfo"
 (
	"SKUCustInfoID"			SERIAL, 
	"SKUID"			INTEGER DEFAULT 0, 
	"CustID"			INTEGER DEFAULT 0, 
	"SKUOnly"			BOOL NOT NULL DEFAULT FALSE, 
	"SKUNever"			BOOL NOT NULL DEFAULT FALSE, 
	"SKUOnlyDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"SKUNeverDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"SKUCustNotes"			TEXT
);

-- CREATE INDEXES ...
CREATE INDEX "tblSKUCustInfo_CustID_idx" ON "tblSKUCustInfo" ("CustID");
ALTER TABLE "tblSKUCustInfo" ADD CONSTRAINT "tblSKUCustInfo_pkey" PRIMARY KEY ("SKUCustInfoID");
CREATE INDEX "tblSKUCustInfo_SKUID_idx" ON "tblSKUCustInfo" ("SKUID");

CREATE TABLE "tblSupplierPmtsItems"
 (
	"SPmtsItemsID"			SERIAL, 
	"SPmtsID"			INTEGER DEFAULT 0, 
	"POItemsID"			INTEGER DEFAULT 0, 
	"SPmtsTotal"			NUMERIC(15,2) DEFAULT 0
);

-- CREATE INDEXES ...
CREATE INDEX "tblSupplierPmtsItems_POID1_idx" ON "tblSupplierPmtsItems" ("POItemsID");
ALTER TABLE "tblSupplierPmtsItems" ADD CONSTRAINT "tblSupplierPmtsItems_pkey" PRIMARY KEY ("SPmtsItemsID");

CREATE TABLE "tblTaxJurisdiction"
 (
	"TJID"			SERIAL, 
	"JurisdictionCode"			VARCHAR (255), 
	"JurisdictionName"			VARCHAR (255), 
	"RateEffDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"TaxRate"			REAL DEFAULT 0
);

-- CREATE INDEXES ...
CREATE INDEX "tblTaxJurisdiction_JurisdictionCode_idx" ON "tblTaxJurisdiction" ("JurisdictionCode");
ALTER TABLE "tblTaxJurisdiction" ADD CONSTRAINT "tblTaxJurisdiction_pkey" PRIMARY KEY ("TJID");

CREATE TABLE "tblVendor"
 (
	"VendorID"			SERIAL, 
	"VendorName"			VARCHAR (255), 
	"VendorAbbr"			VARCHAR (255)
);

-- CREATE INDEXES ...
ALTER TABLE "tblVendor" ADD CONSTRAINT "tblVendor_pkey" PRIMARY KEY ("VendorID");
CREATE UNIQUE INDEX "tblVendor_VendorAbbr_idx" ON "tblVendor" ("VendorAbbr");

CREATE TABLE "tblUpdateNA"
 (
	"SKUID"			SERIAL
);

-- CREATE INDEXES ...

CREATE TABLE "tblAnalysisItems"
 (
	"AnalysisItemsID"			SERIAL, 
	"SKUID"			INTEGER DEFAULT 0, 
	"AOrderDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"AOrderQuant"			INTEGER DEFAULT 0, 
	"AOrderPricePer"			NUMERIC(15,2) DEFAULT 0, 
	"CustomerID"			INTEGER DEFAULT 0, 
	"SplrID"			INTEGER DEFAULT 0, 
	"VSKU"			VARCHAR (255), 
	"SplrID2"			INTEGER DEFAULT 0, 
	"AnalysisID"			INTEGER DEFAULT 0
);

-- CREATE INDEXES ...
CREATE INDEX "tblAnalysisItems_CustomerID_idx" ON "tblAnalysisItems" ("CustomerID");
ALTER TABLE "tblAnalysisItems" ADD CONSTRAINT "tblAnalysisItems_pkey" PRIMARY KEY ("AnalysisItemsID");
CREATE INDEX "tblAnalysisItems_SKUID_idx" ON "tblAnalysisItems" ("SKUID");
CREATE INDEX "tblAnalysisItems_VendorID_idx" ON "tblAnalysisItems" ("SplrID");

CREATE TABLE "tblOrderItems"
 (
	"OrderItemsID"			SERIAL, 
	"SKUID"			INTEGER DEFAULT 0, 
	"POID"			INTEGER DEFAULT 0, 
	"OrderID"			INTEGER DEFAULT 0, 
	"OrderQuant"			INTEGER DEFAULT 0, 
	"OrderPricePer"			NUMERIC(15,2) DEFAULT 0, 
	"OrderPriceTotal"			NUMERIC(15,2) DEFAULT 0, 
	"OrderTaxRate"			REAL DEFAULT 0, 
	"OrderTaxTotal"			NUMERIC(15,2) DEFAULT 0, 
	"OrderDeliveryCostTotal"			NUMERIC(15,2) DEFAULT 0, 
	"OrderFeesTotal"			NUMERIC(15,2) DEFAULT 0, 
	"OrderGrandTotal"			NUMERIC(15,2) DEFAULT 0, 
	"OrderItemsDeliveredDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"OrderDeliveredQuant"			INTEGER DEFAULT 0, 
	"OrderRetailTotal"			NUMERIC(15,2) DEFAULT 0, 
	"OrderItemsUrgent"			BOOL NOT NULL DEFAULT FALSE
);

-- CREATE INDEXES ...
CREATE INDEX "tblOrderItems_POID_idx" ON "tblOrderItems" ("POID");
ALTER TABLE "tblOrderItems" ADD CONSTRAINT "tblOrderItems_pkey" PRIMARY KEY ("OrderItemsID");

CREATE TABLE "tblPurchaseOrder"
 (
	"POID"			SERIAL, 
	"PODate"			TIMESTAMP WITHOUT TIME ZONE, 
	"POBatch"			VARCHAR (255), 
	"SplrID"			INTEGER DEFAULT 0, 
	"SplrID2"			INTEGER DEFAULT 0, 
	"POShipDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"POShipType"			VARCHAR (255), 
	"POTrackingNo"			VARCHAR (255), 
	"PORcvdBy"			VARCHAR (255), 
	"PODatePaid"			TIMESTAMP WITHOUT TIME ZONE, 
	"POMethodPaid"			VARCHAR (255), 
	"POPaymentNo"			VARCHAR (255), 
	"POAmountPaid"			NUMERIC(15,2) DEFAULT 0, 
	"PONotes"			TEXT, 
	"POSplrOrderNo"			VARCHAR (255), 
	"POCheckSentDate"			TIMESTAMP WITHOUT TIME ZONE
);

-- CREATE INDEXES ...
CREATE INDEX "tblPurchaseOrder_POAmountPaid_idx" ON "tblPurchaseOrder" ("POAmountPaid");
CREATE UNIQUE INDEX "tblPurchaseOrder_POBatch_idx" ON "tblPurchaseOrder" ("POBatch");
CREATE INDEX "tblPurchaseOrder_PODatePaid_idx" ON "tblPurchaseOrder" ("PODatePaid");
CREATE INDEX "tblPurchaseOrder_POMethodPaid_idx" ON "tblPurchaseOrder" ("POMethodPaid");
ALTER TABLE "tblPurchaseOrder" ADD CONSTRAINT "tblPurchaseOrder_pkey" PRIMARY KEY ("POID");
CREATE INDEX "tblPurchaseOrder_SupplierID_idx" ON "tblPurchaseOrder" ("SplrID");

CREATE TABLE "tblSupplier"
 (
	"SplrID"			SERIAL, 
	"SplrName"			VARCHAR (255), 
	"SplrFIrst"			VARCHAR (255), 
	"SplrLast"			VARCHAR (255), 
	"SplrBusinessName"			VARCHAR (255), 
	"SplrAddress"			VARCHAR (255), 
	"SplrCity"			VARCHAR (255), 
	"SplrSt"			VARCHAR (255), 
	"SplrZip"			VARCHAR (255), 
	"SplrWebsite"			VARCHAR (255), 
	"SplrEmail"			VARCHAR (255), 
	"SplrPhone"			VARCHAR (255), 
	"SplrFax"			VARCHAR (255), 
	"SplrPrimaryContact1"			VARCHAR (255), 
	"SplrPhone1"			VARCHAR (255), 
	"SplrEmail1"			VARCHAR (255), 
	"SplrPrimaryContact2"			VARCHAR (255), 
	"SplrPhone2"			VARCHAR (255), 
	"SplrEmail2"			VARCHAR (255), 
	"SplrTaxID"			VARCHAR (255), 
	"SplrQBO"			BOOL NOT NULL DEFAULT FALSE, 
	"SplrNotes"			TEXT
);

-- CREATE INDEXES ...
ALTER TABLE "tblSupplier" ADD CONSTRAINT "tblSupplier_pkey" PRIMARY KEY ("SplrID");
CREATE INDEX "tblSupplier_SplrTaxID_idx" ON "tblSupplier" ("SplrTaxID");

CREATE TABLE "tblSupplierPmts"
 (
	"SPmtID"			SERIAL, 
	"SPmtDate"			TIMESTAMP WITHOUT TIME ZONE, 
	"SPmtBatch"			VARCHAR (255)
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tblSupplierPmts_POBatch_idx" ON "tblSupplierPmts" ("SPmtBatch");
ALTER TABLE "tblSupplierPmts" ADD CONSTRAINT "tblSupplierPmts_pkey" PRIMARY KEY ("SPmtID");

CREATE TABLE "AUCCImport201024"
 (
	"OrderDatePaid"			DOUBLE PRECISION, 
	"OrderPaymentMethod"			VARCHAR (255), 
	"OrderPaymentAmount"			DOUBLE PRECISION, 
	"OPmtsBatch"			VARCHAR (255), 
	"OrderID"			DOUBLE PRECISION, 
	"OrderPaymentLessTax"			DOUBLE PRECISION, 
	"OrderPaymentTax"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
CREATE INDEX "AUCCImport201024_OrderDatePaid_idx" ON "AUCCImport201024" ("OrderDatePaid");
CREATE INDEX "AUCCImport201024_OrderID_idx" ON "AUCCImport201024" ("OrderID");

CREATE TABLE "PreImport"
 (
	"PreOrderID"			DOUBLE PRECISION, 
	"SKUID1"			DOUBLE PRECISION, 
	"OrderQuant1"			DOUBLE PRECISION, 
	"OrderPricePer1"			DOUBLE PRECISION, 
	"OrderPriceTotal1"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
CREATE INDEX "PreImport_PreOrderID_idx" ON "PreImport" ("PreOrderID");

CREATE TABLE "DCLocUpdate"
 (
	"User Name"			VARCHAR (255), 
	"Scan Value"			DOUBLE PRECISION, 
	"Timestamp (Scanned)"			VARCHAR (255), 
	"Timestamp (Received)"			VARCHAR (255), 
	"DC Location"			VARCHAR (255)
);

-- CREATE INDEXES ...


-- CREATE Relationships ...
ALTER TABLE "MSysNavPaneGroups" ADD CONSTRAINT "MSysNavPaneGroups_GroupCategoryID_fk" FOREIGN KEY ("GroupCategoryID") REFERENCES "MSysNavPaneGroupCategories"("Id") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "MSysNavPaneGroupToObjects" ADD CONSTRAINT "MSysNavPaneGroupToObjects_GroupID_fk" FOREIGN KEY ("GroupID") REFERENCES "MSysNavPaneGroups"("Id") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblOrder" ADD CONSTRAINT "tblOrder_CustID_fk" FOREIGN KEY ("CustID") REFERENCES "tblCustomer"("CustID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblOrderPmtsItems" ADD CONSTRAINT "tblOrderPmtsItems_OrderItemsID_fk" FOREIGN KEY ("OrderItemsID") REFERENCES "tblOrderItems"("OrderItemsID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblOrderPmtsItems" ADD CONSTRAINT "tblOrderPmtsItems_OPmtsID_fk" FOREIGN KEY ("OPmtsID") REFERENCES "tblOrderPmts"("OPmtsID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblOrderItems" ADD CONSTRAINT "tblOrderItems_OrderID_fk" FOREIGN KEY ("OrderID") REFERENCES "tblOrder"("OrderID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblSupplierPmtsItems" ADD CONSTRAINT "tblSupplierPmtsItems_POItemsID_fk" FOREIGN KEY ("POItemsID") REFERENCES "tblPurchaseOrderItems"("POItemsID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblOrderItems" ADD CONSTRAINT "tblOrderItems_POID_fk" FOREIGN KEY ("POID") REFERENCES "tblPurchaseOrder"("POID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblPurchaseOrderItems" ADD CONSTRAINT "tblPurchaseOrderItems_POID_fk" FOREIGN KEY ("POID") REFERENCES "tblPurchaseOrder"("POID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblOrderItems" ADD CONSTRAINT "tblOrderItems_SKUID_fk" FOREIGN KEY ("SKUID") REFERENCES "tblSKU"("SKUID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblPurchaseOrderItems" ADD CONSTRAINT "tblPurchaseOrderItems_SKUID_fk" FOREIGN KEY ("SKUID") REFERENCES "tblSKU"("SKUID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblSupplierPmtsItems" ADD CONSTRAINT "tblSupplierPmtsItems_SPmtsID_fk" FOREIGN KEY ("SPmtsID") REFERENCES "tblSupplierPmts"("SPmtID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "tblPurchaseOrder" ADD CONSTRAINT "tblPurchaseOrder_SplrID_fk" FOREIGN KEY ("SplrID") REFERENCES "tblSupplier"("SplrID") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;
