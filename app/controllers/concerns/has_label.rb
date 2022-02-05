module HasLabel extend ActiveSupport::Concern

  included do
    button :label, false
    button :label_preview, "Label"

    def label
      render layout: 'pdf/dymo-30256'
    end
  end

end
