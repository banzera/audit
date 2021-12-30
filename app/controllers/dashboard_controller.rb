class DashboardController < ApplicationController
  include DefaultCrudController

  resource_scope -> { Table.all }

  on :export, redirect: -> { export_path }

  def home
  end

  def export
    if request.get?
      DbExportService.export do |zipfile|
        send_data zipfile.data, filename: export_filename
      end
    else
      self.resource = Table.first
      respond_with_success resource, action_name
    end
  end

  private

  def export_filename
    "audit_data_export_#{Time.current.to_s(:number)}.zip"
  end

end
