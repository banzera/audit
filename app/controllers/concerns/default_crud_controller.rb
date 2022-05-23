module DefaultCrudController extend ActiveSupport::Concern

  included do
    include Effective::CrudController

    on     :save, redirect: :show
    submit :save,   'Continue', false
    submit :save,   'Add New', false

    button :audit, false #'View Audit Trail'
    button :destroy, 'Delete', class: 'btn btn-danger', "data-method" => :delete, "data-confirm" => "Really delete @resource?"
    button :cancel,  'Cancel', class: 'btn, btn-secondary-outline'

    def action_missing(action, *args, &block)
      if :cancel == (commit_action[:action] == :save ? :update : commit_action[:action])
        update
      else
        super
      end
    end
  end

end
