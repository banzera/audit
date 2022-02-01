class SkuSelectionInput < SimpleSelect2Input

  def default_value_text
    @default_value_text ||= '' if options[:no_default] || !default_value

    @default_value_text ||= begin
      str = @builder.template.render partial: 'skus/select2/selection', locals: { sku: default_value }
    end
  end

end
