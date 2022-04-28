class PreOrderItemsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource :pre_order
  load_and_authorize_resource :pre_order_item, through: :pre_order, through_association: :items, shallow: true

  before_action :load_resources, except: [:index, :new, :outstanding]

  button :analysis, false

  page_title only: :new do
    "New #{resource_name.titleize}(s) for PreOrder #{@pre_order}"
  end

  on :create, redirect: -> { pre_order_path(resource.pre_order) }
  on :update, redirect: -> { pre_order_path(resource.pre_order) }
  on :destroy, redirect: -> { pre_order_path(resource.pre_order) }

  def show
    @parent = @pre_order_item.pre_order
  end

  def analysis
    render action: :edit
  end

  def outstanding
    @datatable = PreOrderItemOutstandingDatatable.new
    @page_title = "PreOrder Items Outstanding"
  end

  def index
    redirect_to @pre_order if @pre_order
  end

  def update
    super
  end

  private

  def load_resources
    @sku1 = @pre_order_item.sku1
    @sku2 = @pre_order_item.sku2
  end

  def pre_order_item_params
    params.require(:pre_order_item).permit!
  end
end
