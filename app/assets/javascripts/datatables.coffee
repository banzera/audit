$.extend true, $.fn.dataTable.Buttons.defaults,
  dom:
    button:
      className: 'btn btn-secondary btn-sm'

$.extend true, $.fn.dataTable.ext.classes,
  sProcessing:   "dataTables_processing card overlay-wrapper"

fixUpDatatable = ->
  # make the select fields in the column headers use select2
  $('.effective-datatable thead select').select2()

  # fix the select2 configuration of the record_count selector
  # N.B. there may be more than one on a page
  $('.dataTables_wrapper').each (_, o) ->
    try
      $(o).find('.dataTables_length select')
        .removeAttr('name')
        .select2('destroy')

$(document).ready ->
  console.log 'document:ready fired'

$(document).on 'turbolinks:render', ->
  console.log 'turbolinks:render fired'

$(document).on 'turbolinks:load', ->
  console.log 'turbolinks:load fired'

# turbolinks cache fix
$(document).on 'turbolinks:before-cache', ->
  console.log 'turbolinks:before-cache fired'

$(document).on 'effective-bootstrap:initialize', ->
  console.log 'effective-bootstrap:initialize fired'
  fixUpDatatable()
