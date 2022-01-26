class OrderDepositsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

end
