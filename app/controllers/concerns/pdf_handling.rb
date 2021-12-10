module PdfHandling extend ActiveSupport::Concern

  included do
    layout :select_layout!

    before_action :set_pdf_options!
  end

  def converting_to_pdf?
    !!request.env['Rack-Middleware-PDFKit']
  end

  def select_layout!
    converting_to_pdf? ? @pdf_layout : 'application'
  end

  def set_label_options
    if converting_to_pdf?
      @pdf_options = {
        "page-width": "76",
        "page-height": "18",
        "margin-top":     "1",
        "margin-bottom":  "1",
        "margin-left":    "2",
        "margin-right":   "2",
      }
    end
  end

  def set_pdf_options!
    @pdf_layout  = 'pdf/letter'
    @pdf_options = {}
  end

end
