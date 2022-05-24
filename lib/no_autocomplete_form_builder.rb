class NoAutocompleteFormBuilder < SimpleForm::FormBuilder
  def initialize(_, _, _, options)
    options[:html] ||= {}
    options[:html].deep_merge!(autocomplete: :off)

    options[:defaults] ||= {}
    options[:defaults].deep_merge!(input_html: {
      autocomplete: :off,
      onfocus: "$(this).attr('autocomplete', 'no')"
    })

    super
  end

  # fake our name b/c effective addresses only works with certain builders
  # and checks by name :(
  def self.name
    "SimpleForm::FormBuilder".freeze
  end
end
