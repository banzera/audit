class DateTimeInput < SimpleForm::Inputs::Base
  def input(wrapper_options={})

    object_id = ['dp', object_name, attribute_name].join '_'

    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    opts = merged_input_options.merge('data-target': "##{object_id}")
    field = @builder.text_field(attribute_name, opts)

    haml = Haml::Engine.new <<~HAML
      .input-group.date{:id => object_id, "data-target-input" => "nearest"}
        =field
        .input-group-append{"data-target" => "##{object_id}", "data-toggle" => "datetimepicker"}
          .input-group-text
            %i.fa.fa-calendar
    HAML

    picker_options = options[:picker_options] || {
      format: 'L',
      extraFormats: ["YYYY-MM-DD HH:mm::ss z"]
    }

    script = Haml::Engine.new <<~HAML
      :coffee
        $(document).ready () ->
          $('##{object_id}').datetimepicker #{picker_options.to_json}
    HAML

    template.content_for(:scripts) { script.render }

    haml.render(Object.new, field: field, object_id: object_id)
  end

  def input_html_classes
    super << 'datetimepicker-input'
  end
end
