EffectiveAddresses.setup do |config|
  # Database table name to store addresses in.  Default is :addresses
  config.addresses_table_name = :addresses

  # Display Full Name on Address forms, and validate presence by default
  # (can be overridden on a per address basis)
  config.use_full_name = false

  # A 3rd address field
  config.use_address3 = false

  # Country codes to display in country_select dropdowns.
  config.country_codes = 'US'
  # config.country_codes = ['US', 'CA'] # Or you can be more selective...

  # Select these countries ontop of the others
  # config.country_codes_priority = ['US', 'CA']

  # Force this country to be preselected on any new address forms.
  # Valid values are: country code, country name, or nil.
  # Leave nil if using Geocoder for IP based discovery.
  config.pre_selected_country = 'US'

  # Force this state to be preselected on any new address forms.
  # Must also define pre_selected_country for this to take affect
  # Valid values are: state code, state name, or nil.
  # Leave nil if using Geocoder for IP based discovery.
  config.pre_selected_state = 'KS'

  # Validate that the postal/zip code format is correct for these countries
  # Right now, only US and Canada are supported
  config.validate_postal_code_format = ['US', 'CA']

  # SimpleForm Options
  # This Hash of options will be passed into any simple_form_for() calls
  config.simple_form_options = {
    :html => {:class => ['form-vertical']},
    :wrapper => :vertical_form,
    input_html: { class: 'form-control', autocomplete: 'off', onfocus: "$(this).attr('autocomplete', 'no')" }
  }
end
