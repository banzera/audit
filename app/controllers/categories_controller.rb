class CategoriesController < ApplicationController
  include DefaultCrudController

  def permitted_params
    params.require(:category).permit([
      :categorydesc,
    ])
  end

end
