$.extend true, $.fn.dataTable.Buttons.defaults,
  dom:
    button:
      className: 'btn btn-secondary btn-sm'

$.extend true, $.fn.dataTable.ext.classes,
  sProcessing:   "dataTables_processing card overlay-wrapper"

destroySelect2s = ->
  $('.effective-datatables-filters').find('select').select2('destroy')

  # fix the select2 configuration of the record_count selector
  # N.B. there may be more than one on a page
  $('.dataTables_wrapper').each (_, o) ->
    try
      $(o).find('.dataTables_length select')
        .removeAttr('name')
        .select2('destroy')

fixUpDatatable = ->
  # make the select fields in the column headers use select2
  $('.effective-datatable thead select').select2()

logEvent = (e) -> console.log(e)

$(document).ready (e) ->
  logEvent 'document:ready'
  # destroySelect2s()

$(document).on 'effective-bootstrap:initialize', (e) -> fixUpDatatable()

$(document).on 'turbolinks:before-cache', (e) -> logEvent e.type
$(document).on 'turbolinks:render', (e) -> logEvent e.type
$(document).on 'turbolinks:load',   (e) ->
  logEvent e.type
  destroySelect2s()
