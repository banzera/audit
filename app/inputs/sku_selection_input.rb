class SkuSelectionInput < SimpleSelect2Input

  def default_value_text
    @default_value_text ||= '' if options[:no_default] || !default_value

    @default_value_text ||= begin
      str = @builder.template.render partial: 'skus/select2/selection', locals: { sku: default_value }
    end
  end

  def template_selection?
    true
  end

  def template_selection
    @templateSelection ||= template_selection? ? "templateSelection: #{selection_fx}," : ''
  end

  def selection_fx
    fx = <<-STR
      function(item) {
        if(item.selection) { return $(item.selection) }
        return item.text
      }
    STR
  end

  def template_result?
    options[:template_result].present? || true
  end

  def template_result
    @templateResult ||= template_result? ? "templateResult: #{result_fx}," : ''
  end

  def result_fx
    fx = <<-STR
      function(item) {
        if(!item.result) {
          return item.text
        }

        $result = $(item.result)
        $result.find('a').on('mouseup', function(e) {
          e.stopPropagation();
        });

        return $result
      }
    STR
  end

end
