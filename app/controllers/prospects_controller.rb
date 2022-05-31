class ProspectsController < ApplicationController
  include DefaultCrudController

  submit :cancel, false

  before_action :set_opts, only: :index

  def set_opts
    @dt_opts = { inline: true }
  end

  def prospect_params
    pp = params.require(:prospect).permit([
      :office_name,
      :clinic_type_id,
      :status,
      :assigned_to_id,
      :contact_phone,
      :alt_phone,
      :doctors_names,
      :notes,
      primary_address: EffectiveAddresses.permitted_params,
    ])
  end

end
