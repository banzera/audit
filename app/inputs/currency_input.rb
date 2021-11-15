class CurrencyInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options={})
    haml = Haml::Engine.new <<~STR
      .input-group
        .input-group-prepend
          %span.input-group-text $
        #{super}
        .input-group-append
          %span.input-group-text .00
    STR

    haml.render
  end
end
