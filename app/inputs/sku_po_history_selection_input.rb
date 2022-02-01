class SkuPoHistorySelectionInput < SimpleSelect2Input

  def default_value
    SkuPoHistory.for_po(object.poid).for_sku(object.skuid).first
  end

  def default_value_text
    @default_value_text ||= '' if options[:no_default] || !default_value

    @default_value_text ||= begin
      template.render partial: 'sku_po_histories/select2/selection', locals: { po: default_value }
    end
  end

  def url
    params = {}.tap do |p|
      p[:available_only] = true if options[:available_only]
    end

    if sku = (options[:for_sku] || object.skuid)
      @url = template.po_history_sku_path(sku, params)
    else
      # raise ArgumentError.new("#{self.class.name} requires 'for_sku' option or an object with a `skuid` attribute")
      @url = template.sku_po_histories_path(params)
    end

  end

  def select2_options
    @select2_options ||= """
      minimumResultsForSearch: 10,
      allowClear:  true,
      placeholder: '#{placeholder_text || 'Select...'}',
      quietMillis: 50,
      #{dropdown_parent}
      #{select2_ajax_options}
      #{tags}
      #{template_selection}
      #{template_result}
      _: ''
    """
  end

end
