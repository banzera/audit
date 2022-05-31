class CurrencyInput < SimpleForm::Inputs::NumericInput
  def input(wrapper_options={})
    haml = Haml::Engine.new <<~STR
      .input-group
        .input-group-prepend
          %span.input-group-text $
        #{super}
    STR

    haml.render
  end
end
