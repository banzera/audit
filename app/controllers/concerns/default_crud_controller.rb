module DefaultCrudController extend ActiveSupport::Concern

  included do
    include Effective::CrudController

    on     :save, redirect: :show
    submit :save,   'Continue', false
    submit :save,   'Add New', false
    submit :cancel, 'Cancel', formnovalidate: true,
                              redirect: -> { url_for only_path: true },
                              success: ->  { nil } # nil to disable flash

    button :audit, false #'View Audit Trail'
  end


end
