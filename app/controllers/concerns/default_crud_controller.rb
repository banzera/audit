module DefaultCrudController extend ActiveSupport::Concern

  included do
    include Effective::CrudController

    on     :save, redirect: :show
    submit :save,   'Continue', false
    submit :save,   'Add New', false
    submit :cancel, 'Cancel', formnovalidate: true,
                              redirect: -> {
                                r = resource.respond_to?(:parent) ? resource.parent : resource
                                polymorphic_path(r)
                              },
                              success: ->  { nil } # nil to disable flash

    button :audit, false #'View Audit Trail'

    def action_missing(action, *args, &block)
      if :cancel == (commit_action[:action] == :save ? :update : commit_action[:action])
        update
      else
        super
      end
    end
  end

end
