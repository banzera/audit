module StimulusComponent

  def stimulus(wrapper_options = nil)
    return unless action || target_value

    data = input_html_options[:data] ||= {}

    data[target_key] = target_value
    data[:action]    = action

    nil
  end

  private

  def target_key
    controller_name = options.dig(:stimulus, :controller)
    [controller_name, 'target'].compact.join('-')
  end

  def target_value
    options.dig(:stimulus, :target)
  end

  def action
    options.dig(:stimulus, :action)
  end

  def data_options
     "#{object_name}_#{attribute_name}"
    options[:data_attributes]
  end
end

SimpleForm.include_component(StimulusComponent)
