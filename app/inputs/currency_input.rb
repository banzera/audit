class CurrencyInput < SimpleForm::Inputs::NumericInput
  include ActionView::Helpers::NumberHelper

  def input(wrapper_options={})
    raw_value       = object.public_send attribute_name
    formatted_value = number_with_precision(raw_value, precision: 2)

    input_html_options.reverse_merge!(value: formatted_value)

    haml = Haml::Engine.new <<~STR
      .input-group
        .input-group-prepend
          %span.input-group-text $
        #{super}
    STR

    haml.render
  end
end
