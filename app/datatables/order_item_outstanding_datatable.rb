class OrderItemOutstandingDatatable < Effective::Datatable

  collection do
    scope = OrderItemOutstanding.all
  end

  # filters do
  #   scope :all, default: true
  # end

  datatable do
    order :customer, :asc

    col :customer, action: :show

    col :orderbatch
    col :order, action: :show
    col :orderdate, as: :date
    col :sku, action: :show
    col :manf
    col :itemno
    col :skudesc
    col :orderquant
    col :orderdeliveredquant
    col :orderquantdue
    col :dccurquant
    # dcdu
    col :dcloc

    #                     :id => :uuid,
    #                 :orderid => :integer,
    #               :orderdate => :datetime,
    #              :orderbatch => :string,
    #                  :custid => :integer,
    #            :ordertaxrate => :float,
    #      :orderdelivereddate => :datetime,
    #       :orderdeliverdfrom => :string,
    #        :orderdeliveredto => :string,
    #         :ordershipmethod => :string,
    #          :orderreceipthl => :string,
    #       :orderdateinvoiced => :datetime,
    #           :orderdatepaid => :datetime,
    #      :orderpaymentmethod => :string,
    #      :orderpaymentamount => :float,
    #              :ordernotes => :text,
    #            :orderitemsid => :integer,
    #                   :skuid => :integer,
    #                    :poid => :integer,
    #              :orderquant => :integer,
    #     :orderdeliveredquant => :integer,
    #           :orderquantdue => :integer,
    #           :orderpriceper => :float,
    #         :orderpricetotal => :float,
    #     :order_item_tax_rate => :float,
    #           :ordertaxtotal => :float,
    #  :orderdeliverycosttotal => :float,
    #          :orderfeestotal => :float,
    #         :ordergrandtotal => :float,
    # :orderitemsdelivereddate => :datetime,
    #        :orderretailtotal => :float,
    #                :custname => :string,
    #        :custbusinessname => :string,
    #                        :custfirst => :string,
    #                :custlast => :string,
    #                 :custsal => :string,
    #               :custtitle => :string,
    #             :custaddress => :string,
    #                :custcity => :string,
    #                  :custst => :string,
    #                 :custzip => :string,
    #               :custphone => :string,
    #                 :custfax => :string,
    #               :custemail => :string,
    #     :custprimarycontact1 => :string,
    #              :custphone1 => :string,
    #          :custphonetype1 => :string,
    #              :custemail1 => :string,
    #     :custprimarycontact2 => :string,
    #              :custphone2 => :string,
    #          :custphonetype2 => :string,
    #              :custemail2 => :string,
    #             :custtaxrate => :float,
    #               :custnotes => :text,
    #         :custdatecreated => :datetime,
    #        :custdatemodified => :datetime,
    # :custbillingbusinessname => :string,
    #        :custbillingfirst => :string,
    #         :custbillinglast => :string,
    #          :custbillingsal => :string,
    #        :custbillingtitle => :string,
    #      :custbillingaddress => :string,
    #         :custbillingcity => :string,
    #           :custbillingst => :string,
    #          :custbillingzip => :string,
    #        :custbillingphone => :string,
    #          :custbillingfax => :string,
    #        :custbillingemail => :string,
    #         :custbillingsame => :boolean,
    #                 :custqbo => :boolean,
    #                     :sku => :string,
    #                    :manf => :string,
    #                  :itemno => :string,
    #                 :skudesc => :string,
    #              :unitweight => :string,
    #              :categoryid => :integer,
    #             :skuminunits => :integer,
    #         :skuminunitstype => :string,
    #                   :dcloc => :string,
    #             :skuminpercs => :integer,
    #                   :total => :integer,
    #               :totalrcvd => :integer,
    #                :totaldue => :integer,
    #              :dccurquant => :integer
    actions_col
  end
end
