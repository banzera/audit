class OrderPaymentsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

end
