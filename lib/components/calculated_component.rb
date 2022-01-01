module CalculatedComponent

  def calculated(wrapper_options = nil)

    input_html_options[:tabindex] = -1
    input_html_options[:readonly] ||= true

    input_html_classes << :readonly
    input_html_classes << :calculated

    nil
  end

  private

end

SimpleForm.include_component(CalculatedComponent)
