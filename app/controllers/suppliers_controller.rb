class SuppliersController < ApplicationController
  include Effective::CrudController

  def suppliers_params
    params.require(:supplier).permit([
      :splrname,
      :splrfirst,
      :splrlast,
      :splrbusinessname,
      :splraddress,
      :splrcity,
      :splrst,
      :splrzip,
      :splrwebsite,
      :splremail,
      :splrphone,
      :splrfax,
      :splrprimarycontact1,
      :splrphone1,
      :splremail1,
      :splrprimarycontact2,
      :splrphone2,
      :splremail2,
      :splrtaxid,
      :splrqbo,
      :splrnotes,
    ])
  end

end
