module LinkedToComponent

  def linked_to(wrapper_options = nil)
    input_html_options[:data] ||= {}
    input_html_options[:data][:target] ||= target
    nil
  end

  private

  def target
    target_attr = options[:linked_to]
     "##{object_name}_#{target_attr}"
  end
end

SimpleForm.include_component(LinkedToComponent)
