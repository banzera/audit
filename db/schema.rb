# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_01_175134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "tblanalysis", primary_key: "analysisid", id: :integer, default: -> { "nextval('tblanalysis_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "customerid"
    t.datetime "analysisdate"
    t.datetime "startanalysisdate"
    t.datetime "endanalysisdate"
    t.integer "analysissplrid"
    t.index ["analysissplrid"], name: "index_tblanalysis_on_analysissplrid"
    t.index ["customerid"], name: "index_tblanalysis_on_customerid"
  end

  create_table "tblanalysisitems", primary_key: "analysisitemsid", id: :integer, default: -> { "nextval('tblanalysisitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "skuid"
    t.datetime "aorderdate"
    t.integer "aorderquant"
    t.float "aorderpriceper"
    t.integer "customerid"
    t.integer "splrid"
    t.string "vsku", limit: 255
    t.integer "splrid2"
    t.integer "analysisid"
    t.index ["customerid"], name: "index_tblanalysisitems_on_customerid"
    t.index ["skuid"], name: "index_tblanalysisitems_on_skuid"
    t.index ["splrid"], name: "index_tblanalysisitems_on_splrid"
  end

  create_table "tblbank", primary_key: "bankid", id: :integer, default: -> { "nextval('tblbank_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "bankname", limit: 255
    t.string "bankbusinessname", limit: 255
    t.string "bankfirst", limit: 255
    t.string "banklast", limit: 255
    t.string "banksal", limit: 255
    t.string "banktitle", limit: 255
    t.string "bankaddress", limit: 255
    t.string "bankcity", limit: 255
    t.string "bankst", limit: 255
    t.string "bankzip", limit: 255
    t.string "bankphone", limit: 255
    t.string "bankfax", limit: 255
    t.string "bankemail", limit: 255
    t.string "bankprimarycontact1", limit: 255
    t.string "bankphone1", limit: 255
    t.string "bankphonetype1", limit: 255
    t.string "bankemail1", limit: 255
    t.string "bankprimarycontact2", limit: 255
    t.string "bankphone2", limit: 255
    t.string "bankphonetype2", limit: 255
    t.string "bankemail2", limit: 255
    t.string "bankacctno", limit: 255
    t.string "bankacctname", limit: 255
    t.text "banknotes"
    t.datetime "bankdatemodified"
    t.index ["bankname"], name: "index_tblbank_on_bankname"
  end

  create_table "tblcategory", primary_key: "categoryid", id: :integer, default: -> { "nextval('tblcategory_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "categorydesc", limit: 255
  end

  create_table "tblcustomer", primary_key: "custid", id: :integer, default: -> { "nextval('tblcustomer_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "custname", limit: 255
    t.string "custbusinessname", limit: 255
    t.string "custfirst", limit: 255
    t.string "custlast", limit: 255
    t.string "custsal", limit: 255
    t.string "custtitle", limit: 255
    t.string "custaddress", limit: 255
    t.string "custcity", limit: 255
    t.string "custst", limit: 255
    t.string "custzip", limit: 255
    t.string "custphone", limit: 255
    t.string "custfax", limit: 255
    t.string "custemail", limit: 255
    t.string "custprimarycontact1", limit: 255
    t.string "custphone1", limit: 255
    t.string "custphonetype1", limit: 255
    t.string "custemail1", limit: 255
    t.string "custprimarycontact2", limit: 255
    t.string "custphone2", limit: 255
    t.string "custphonetype2", limit: 255
    t.string "custemail2", limit: 255
    t.float "custtaxrate"
    t.text "custnotes"
    t.datetime "custdatecreated"
    t.datetime "custdatemodified"
    t.string "custbillingbusinessname", limit: 255
    t.string "custbillingfirst", limit: 255
    t.string "custbillinglast", limit: 255
    t.string "custbillingsal", limit: 255
    t.string "custbillingtitle", limit: 255
    t.string "custbillingaddress", limit: 255
    t.string "custbillingcity", limit: 255
    t.string "custbillingst", limit: 255
    t.string "custbillingzip", limit: 255
    t.string "custbillingphone", limit: 255
    t.string "custbillingfax", limit: 255
    t.string "custbillingemail", limit: 255
    t.boolean "custbillingsame"
    t.boolean "custqbo"
    t.boolean "custccauth"
    t.string "custcclast4", limit: 255
    t.integer "custtaxjurisid"
    t.datetime "lastrewarddate"
    t.string "custhsacct", limit: 255
    t.boolean "discontinued"
    t.string "custtyfirstname", limit: 255
    t.string "custtylastname", limit: 255
    t.string "custtyaddress", limit: 255
    t.string "custtycity", limit: 255
    t.string "custtyst", limit: 255
    t.string "custtyzip", limit: 255
    t.string "custtyphone", limit: 255
    t.string "custtyemail", limit: 255
    t.index ["custname"], name: "index_tblcustomer_on_custname"
    t.index ["custtaxjurisid"], name: "index_tblcustomer_on_custtaxjurisid"
  end

  create_table "tbldclocupdate", primary_key: "dclocupdateid", id: :integer, default: -> { "nextval('tbldclocupdate_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "username", limit: 255
    t.integer "skuid"
    t.string "timestampscanned", limit: 255
    t.string "timestamprcvd", limit: 255
    t.string "dcloc", limit: 255
    t.index ["skuid"], name: "index_tbldclocupdate_on_skuid"
  end

  create_table "tblorder", primary_key: "orderid", id: :integer, default: -> { "nextval('tblorder_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "orderdate"
    t.string "orderbatch", limit: 255
    t.integer "custid"
    t.float "ordertaxrate"
    t.datetime "orderdelivereddate"
    t.string "orderdeliverdfrom", limit: 255
    t.string "orderdeliveredto", limit: 255
    t.string "ordershipmethod", limit: 255
    t.string "orderreceipthl", limit: 255
    t.datetime "orderdateinvoiced"
    t.datetime "orderdatepaid"
    t.string "orderpaymentmethod", limit: 255
    t.float "orderpaymentamount"
    t.text "ordernotes"
    t.datetime "orderccdate"
    t.datetime "preordercompletedate"
    t.datetime "orderconfirmdate"
    t.index ["custid"], name: "index_tblorder_on_custid"
    t.index ["orderbatch"], name: "index_tblorder_on_orderbatch"
    t.index ["orderdateinvoiced"], name: "index_tblorder_on_orderdateinvoiced"
    t.index ["orderdatepaid"], name: "index_tblorder_on_orderdatepaid"
  end

  create_table "tblorderdeposit", primary_key: "odepositid", id: :integer, default: -> { "nextval('tblorderdeposit_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "odepositdate"
    t.string "odepositbatch", limit: 255
    t.index ["odepositbatch"], name: "index_tblorderdeposit_on_odepositbatch"
  end

  create_table "tblorderitems", primary_key: "orderitemsid", id: :integer, default: -> { "nextval('tblorderitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "skuid"
    t.integer "poid"
    t.integer "orderid"
    t.integer "orderquant"
    t.float "orderpriceper"
    t.float "orderpricetotal"
    t.float "ordertaxrate"
    t.float "ordertaxtotal"
    t.float "orderdeliverycosttotal"
    t.float "orderfeestotal"
    t.float "ordergrandtotal"
    t.datetime "orderitemsdelivereddate"
    t.integer "orderdeliveredquant"
    t.float "orderretailtotal"
    t.index ["orderid"], name: "index_tblorderitems_on_orderid"
    t.index ["poid"], name: "index_tblorderitems_on_poid"
    t.index ["skuid"], name: "index_tblorderitems_on_skuid"
  end

  create_table "tblorderpmts", primary_key: "opmtsid", id: :integer, default: -> { "nextval('tblorderpmts_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "opmtsdate"
    t.string "opmtsbatch", limit: 255
    t.index ["opmtsbatch"], name: "index_tblorderpmts_on_pobatch"
  end

  create_table "tblorderpmtsitems", primary_key: "opmtsitemsid", id: :integer, default: -> { "nextval('tblorderpmtsitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "opmtsid"
    t.integer "orderitemsid"
    t.float "opmtstotal"
    t.integer "odepositid"
    t.index ["opmtsid"], name: "index_tblorderpmtsitems_on_opmtsid"
    t.index ["orderitemsid"], name: "index_tblorderpmtsitems_on_orderitemsid"
  end

  create_table "tblpercent", primary_key: "percent", id: :float, force: :cascade do |t|
  end

  create_table "tblpreorder", primary_key: "preorderid", id: :integer, default: -> { "nextval('tblpreorder_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "preorderdate"
    t.string "preorderbatch", limit: 255
    t.integer "custid"
    t.text "preordernotes"
    t.float "preordersh1"
    t.float "preordersh2"
    t.integer "preordervendorid"
    t.integer "orderid"
    t.datetime "ordercreatedate"
    t.datetime "preorderanalysisdate"
    t.datetime "confirmationdate"
    t.datetime "preordercheck"
    t.index ["custid"], name: "index_tblpreorder_on_custid"
    t.index ["preorderbatch"], name: "index_tblpreorder_on_preorderbatch"
    t.index ["preordervendorid"], name: "index_tblpreorder_on_preordervendorid"
  end

  create_table "tblpreordercodes", primary_key: "preordercodeid", id: :integer, default: -> { "nextval('tblpreordercodes_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "preordercode", limit: 255
    t.string "preordercodedesc", limit: 255
    t.index ["preordercode"], name: "index_tblpreordercodes_on_preordercode"
  end

  create_table "tblpreorderitems", primary_key: "preorderitemsid", id: :integer, default: -> { "nextval('tblpreorderitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "preorderid"
    t.integer "poid"
    t.integer "skuid1"
    t.integer "skuid2"
    t.integer "orderquant1"
    t.integer "orderquant2"
    t.float "orderpriceper1"
    t.float "orderpriceper2"
    t.float "orderpricetotal1"
    t.float "orderpricetotal2"
    t.float "orderaupriceper"
    t.integer "preorderitemcode"
    t.datetime "orderdate"
    t.text "preordernotes"
    t.index ["preorderitemcode"], name: "index_tblpreorderitems_on_preorderitemcode"
  end

  create_table "tblpurchaseorder", primary_key: "poid", id: :integer, default: -> { "nextval('tblpurchaseorder_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "podate"
    t.string "pobatch", limit: 255
    t.integer "splrid"
    t.integer "splrid2"
    t.datetime "poshipdate"
    t.string "poshiptype", limit: 255
    t.string "potrackingno", limit: 255
    t.string "porcvdby", limit: 255
    t.datetime "podatepaid"
    t.string "pomethodpaid", limit: 255
    t.string "popaymentno", limit: 255
    t.float "poamountpaid"
    t.text "ponotes"
    t.string "posplrorderno", limit: 255
    t.datetime "pochecksentdate"
    t.index ["poamountpaid"], name: "index_tblpurchaseorder_on_poamountpaid"
    t.index ["pobatch"], name: "index_tblpurchaseorder_on_pobatch", unique: true
    t.index ["podatepaid"], name: "index_tblpurchaseorder_on_podatepaid"
    t.index ["pomethodpaid"], name: "index_tblpurchaseorder_on_pomethodpaid"
    t.index ["splrid"], name: "index_tblpurchaseorder_on_splrid"
  end

  create_table "tblpurchaseorderitems", primary_key: "poitemsid", id: :integer, default: -> { "nextval('tblpurchaseorderitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "poid"
    t.integer "skuid"
    t.integer "poorderquant"
    t.float "poorderprice", default: 0.0
    t.float "poordertax", default: 0.0
    t.float "poordershipping", default: 0.0
    t.float "poorderfees", default: 0.0
    t.float "poordertotal", default: 0.0
    t.float "poorderpriceper", default: 0.0
    t.float "poordertaxper", default: 0.0
    t.float "poordershippingper", default: 0.0
    t.float "poorderfeesper", default: 0.0
    t.float "poordertotalper", default: 0.0
    t.datetime "poorderrcvddate"
    t.integer "poorderrcvdquant", default: 0
    t.datetime "poorderexpiration"
    t.datetime "poorderrebatedeadline"
    t.datetime "poorderrebatesubmitted"
    t.boolean "poorderrebate", default: false, null: false
    t.string "poorderrebatenotes", limit: 255
  end

  create_table "tblpurchasetype", primary_key: "purchasetypeid", id: :integer, default: -> { "nextval('tblpurchasetype_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "purchasetype", limit: 255
  end

  create_table "tblshipper", primary_key: "shipid", id: :integer, default: -> { "nextval('tblshipper_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "shipname", limit: 255
    t.string "shipfirst", limit: 255
    t.string "shiplast", limit: 255
    t.string "shipbusinessname", limit: 255
    t.string "shipaddress", limit: 255
    t.string "shipcity", limit: 255
    t.string "shipst", limit: 255
    t.string "shipzip", limit: 255
    t.string "shipphone1", limit: 255
    t.string "shipphone2", limit: 255
    t.string "shipfax", limit: 255
    t.string "shipemail1", limit: 255
    t.string "shipemail2", limit: 255
    t.string "shipprimarycontact1", limit: 255
    t.string "shipprimarycontact2", limit: 255
  end

  create_table "tblsku", primary_key: "skuid", id: :integer, default: -> { "nextval('tblsku_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "sku", limit: 255
    t.string "manf", limit: 255
    t.string "itemno", limit: 255
    t.string "skudesc", limit: 255
    t.string "unitweight", limit: 255
    t.integer "categoryid"
    t.integer "skuminunits"
    t.string "skuminunitstype", limit: 255
    t.string "dcloc", limit: 255
    t.integer "skuminpercs"
    t.integer "vno01"
    t.string "vsku01", limit: 255
    t.text "vhl01"
    t.integer "vno02"
    t.string "vsku02", limit: 255
    t.text "vhl02"
    t.integer "vno03"
    t.string "vsku03", limit: 255
    t.text "vhl03"
    t.integer "vno04"
    t.string "vsku04", limit: 255
    t.text "vhl04"
    t.integer "vno05"
    t.string "vsku05", limit: 255
    t.text "vhl05"
    t.integer "vno06"
    t.string "vsku06", limit: 255
    t.text "vhl06"
    t.integer "vno07"
    t.string "vsku07", limit: 255
    t.text "vhl07"
    t.integer "vno08"
    t.string "vsku08", limit: 255
    t.text "vhl08"
    t.integer "vno09"
    t.string "vsku09", limit: 255
    t.text "vhl09"
    t.integer "vno10"
    t.string "vsku10", limit: 255
    t.text "vhl10"
    t.float "skuhighprice"
    t.integer "skuhighpricevno"
    t.datetime "skuhighpricedate"
    t.integer "skuclassid"
    t.integer "skumaxtemp"
    t.integer "skumintemp"
    t.text "skunotes"
    t.tsvector "tsv"
    t.index ["itemno"], name: "index_tblsku_on_itemno", unique: true
    t.index ["sku"], name: "index_tblsku_on_sku", unique: true
    t.index ["skuclassid"], name: "index_tblsku_on_skuclassid"
  end

  create_table "tblskuclass", primary_key: "skuclassid", id: :integer, default: -> { "nextval('tblskuclass_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "skuclassdesc", limit: 255
  end

  create_table "tblskucustinfo", primary_key: "skucustinfoid", id: :integer, default: -> { "nextval('tblskucustinfo_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "skuid"
    t.integer "custid"
    t.boolean "skuonly"
    t.boolean "skunever"
    t.datetime "skuonlydate"
    t.datetime "skuneverdate"
    t.text "skucustnotes"
    t.index ["custid"], name: "index_tblskucustinfo_on_custid"
    t.index ["skuid"], name: "index_tblskucustinfo_on_skuid"
  end

  create_table "tblsupplier", primary_key: "splrid", id: :integer, default: -> { "nextval('tblsupplier_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "splrname", limit: 255
    t.string "splrfirst", limit: 255
    t.string "splrlast", limit: 255
    t.string "splrbusinessname", limit: 255
    t.string "splraddress", limit: 255
    t.string "splrcity", limit: 255
    t.string "splrst", limit: 255
    t.string "splrzip", limit: 255
    t.string "splrwebsite", limit: 255
    t.string "splremail", limit: 255
    t.string "splrphone", limit: 255
    t.string "splrfax", limit: 255
    t.string "splrprimarycontact1", limit: 255
    t.string "splrphone1", limit: 255
    t.string "splremail1", limit: 255
    t.string "splrprimarycontact2", limit: 255
    t.string "splrphone2", limit: 255
    t.string "splremail2", limit: 255
    t.string "splrtaxid", limit: 255
    t.boolean "splrqbo"
    t.text "splrnotes"
    t.index ["splrtaxid"], name: "index_tblsupplier_on_splrtaxid"
  end

  create_table "tblsupplierpmts", primary_key: "spmtid", id: :integer, default: -> { "nextval('tblsupplierpmts_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "spmtdate"
    t.string "spmtbatch", limit: 255
    t.index ["spmtbatch"], name: "index_tblsupplierpmts_on_spmtbatch", unique: true
  end

  create_table "tblsupplierpmtsitems", primary_key: "spmtsitemsid", id: :integer, default: -> { "nextval('tblsupplierpmtsitems_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "spmtsid"
    t.integer "poitemsid"
    t.float "spmtstotal"
    t.index ["poitemsid"], name: "index_tblsupplierpmtsitems_on_poitemsid"
  end

  create_table "tbltaxjurisdiction", primary_key: "tjid", id: :integer, default: -> { "nextval('tbltaxjurisdiction_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "jurisdictioncode", limit: 255
    t.string "jurisdictionname", limit: 255
    t.datetime "rateeffdate"
    t.float "taxrate"
    t.index ["jurisdictioncode"], name: "index_tbltaxjurisdiction_on_jurisdictioncode"
  end

  create_table "tblupdatena", primary_key: "skuid", id: :integer, default: -> { "nextval('tblupdatena_id_seq'::regclass)" }, force: :cascade do |t|
  end

  create_table "tblvendor", primary_key: "vendorid", id: :integer, default: -> { "nextval('tblvendor_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "vendorname", limit: 255
    t.string "vendorabbr", limit: 255
  end

  create_table "users", comment: "Contains all the user login/profile information", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "default_company_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin"
    t.boolean "active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["created_by_id"], name: "index_users_on_created_by_id"
    t.index ["default_company_id"], name: "index_users_on_default_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["updated_by_id"], name: "index_users_on_updated_by_id"
  end

  add_foreign_key "tblorder", "tblcustomer", column: "custid", primary_key: "custid", name: "tblorder_custid_fkey"
  add_foreign_key "tblorderitems", "tblorder", column: "orderid", primary_key: "orderid", name: "tblorderitems_orderid_fkey"
  add_foreign_key "tblorderitems", "tblpurchaseorder", column: "poid", primary_key: "poid", name: "tblorderitems_poid_fkey"
  add_foreign_key "tblorderitems", "tblsku", column: "skuid", primary_key: "skuid", name: "tblorderitems_skuid_fkey"
  add_foreign_key "tblorderpmtsitems", "tblorderitems", column: "orderitemsid", primary_key: "orderitemsid", name: "tblorderpmtsitems_orderitemsid_fkey"
  add_foreign_key "tblorderpmtsitems", "tblorderpmts", column: "opmtsid", primary_key: "opmtsid", name: "tblorderpmtsitems_opmtsid_fkey"
  add_foreign_key "tblpurchaseorder", "tblsupplier", column: "splrid", primary_key: "splrid", name: "tblpurchaseorder_splrid_fkey"
  add_foreign_key "tblpurchaseorderitems", "tblpurchaseorder", column: "poid", primary_key: "poid", name: "tblpurchaseorderitems_poid_fkey"
  add_foreign_key "tblpurchaseorderitems", "tblsku", column: "skuid", primary_key: "skuid", name: "tblpurchaseorderitems_skuid_fkey"
  add_foreign_key "tblsupplierpmtsitems", "tblpurchaseorderitems", column: "poitemsid", primary_key: "poitemsid", name: "tblsupplierpmtsitems_poitemsid_fkey"
  add_foreign_key "tblsupplierpmtsitems", "tblsupplierpmts", column: "spmtsid", primary_key: "spmtid", name: "tblsupplierpmtsitems_spmtsid_fkey"
end
