class CategoriesController < ApplicationController
  include Effective::CrudController

  def permitted_params
    params.require(:category).permit([
      :categorydesc,
    ])
  end

end
