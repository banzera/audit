module StepperHelper

  def step_content_for(arg, opts = {})
    partial_name = "#{controller_name}/#{action_name}_steps/#{arg}"

    render partial: partial_name, locals: { f: opts[:form]}
  end

  def next_step_button
    haml = Haml::Engine.new <<~STR
      %button.next.btn.btn-block.btn-success.btn-lg
        Next
        %i.fa.fa-angle-double-right.fas
    STR
    haml.render
  end

  def back_step_button
    haml = Haml::Engine.new <<~STR
      %button.back.btn.btn-block.btn-success.btn-lg
        %i.fa.fa-angle-double-left.fas
        Back
    STR
    haml.render
  end

  def step_nav_buttons
    haml = Haml::Engine.new <<~STR
      .row
        .offset-1.col-4
          = back_step_button
        .offset-1.col-4
          = next_step_button
    STR

    haml.render(self)
  end

end
