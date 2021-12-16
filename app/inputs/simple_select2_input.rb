class SimpleSelect2Input < SimpleForm::Inputs::CollectionSelectInput

  def initialize(*args)
    super
    @collection = [''] unless args.last[:no_ajax].present?
  end

  def input(wrapper_options={})

    field = super(wrapper_options)

    script_tag = template.content_tag(:script, type: 'text/javascript') do
      """
      $(document).ready(function() {
        $('##{field_id}').select2({#{select2_options}})#{set_val}
      });
      """.html_safe
    end

    # TODO: make this configurable. For now, we're putting the script local to
    # the field so that dynamic partial page reloading works properly
    #
    # template.content_for :scripts do
    #   script_tag
    # end

    field + script_tag
  end

  def default_value
    @default_value ||= object.send(reflection_or_attribute_name)
  end

  def default_value_id
    @default_value_id ||= default_value.try(:id) || default_value || 'null'
  end

  def default_value_text
    @default_value_text ||= begin
      options[:no_default] == true ? '' : default_value.try(:name) || default_value || ''
    end
  end

  def default_value_hash
    @default_value_hash ||= { id: default_value_id, text: default_value_text }.to_json
  end

  def field_id
    @field_id ||= input_html_options[:id] || "#{object_name}_#{attribute_name}"
  end

  def url
    @url ||= options[:source_url] || "/#{reflection_or_attribute_name.to_s.pluralize}"
  end

  def dropdown_parent
    @dropdown_parent ||= options[:in_modal] ? 'dropdownParent: $(\'.modal\'),' : ''
  end

  def use_tags?
    options[:tags].present?
  end

  def tags
    @tags ||= use_tags? ? 'tags: true, minimumResultsForSearch: 0,' : ''
  end

  def select2_options
    @select2_options ||= """
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

  def select2_ajax_options
    @select2_ajax_options ||= options[:no_ajax] ? '' : """
      data:        [#{default_value_hash}],
      escapeMarkup: function(m) { return m; },
      ajax: {
        url:      '#{url}',
        dataType: 'json',
        type:     'GET',
        data:              function(term) { return { search: term }; },
        processResults:    function(data) { return { results: data.items }; }
      },
    """
  end

  def set_val
    @set_val ||= default_value_text.present? ? ".val('#{default_value_id}').trigger('change.select2');" : ''
  end
end
