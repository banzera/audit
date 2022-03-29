module PrawnRails
  # This derives from Prawn::Document in order to override defaults.
  # Note that the Prawn::Document behaviour itself shouldn't be changed.
  class Document < Prawn::Document
    def bb
      return unless Rails.env.development?

      transparent(0.3) {
        stroke_bounds
        stroke_circle [0, 0], 4
      }
    end

    def bounding_box(point, *args, &block)
      super do
        bb
        yield
      end
    end
  end
end
