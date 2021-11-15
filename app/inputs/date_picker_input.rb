class DatePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options={})

    opts = input_html_options.merge(data: { target: "#dp" })

    field = @builder.text_field(attribute_name, opts)

    add_on_class = options[:add_on_class] || 'fa fa-calendar'

    add_on = template.content_tag(:div, class: 'input-group-append', data: { target: "#dp", toggle: 'datetimepicker' }) do
      template.content_tag(:div, class: 'input-group-text') do
        template.content_tag(:i, '', class: add_on_class)
      end
    end

    all = content_tag(:div, field + add_on, id: "#{attribute_name}_dp_wrapper", class: 'input-group date')

    picker_options = options[:picker_options] || { format: 'L' }

    script = """
      $(document).ready(function() {
        $('.#{input_class}').datetimepicker(
          #{picker_options.to_json}
        );
      });
    """.html_safe

    template.content_for :scripts do
      template.content_tag(:script, type: 'text/javascript') do
        script
      end
    end

    all.html_safe
  end
end
