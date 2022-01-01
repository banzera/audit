module DataAttributesComponent

  def data_attributes(wrapper_options = nil)
    input_html_options[:data] ||= data_options
    puts "Used data_attributes!"
    puts "*"*80
    nil
  end

  private

  def data_options
     "#{object_name}_#{attribute_name}"
    options[:data_attributes]
  end
end

SimpleForm.include_component(DataAttributesComponent)
