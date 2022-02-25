$.fn.select2.defaults.set('theme', 'bootstrap4')
$.fn.select2.defaults.set('allowClear', true)
$.fn.select2.defaults.set('placeholder', 'Select...')

#
# Hacky fix for a bug in select2 with jQuery 3.6.0's new nested-focus "protection"
# see: https://github.com/select2/select2/issues/5993
# see: https://github.com/jquery/jquery/issues/4382
#
# TODO: Recheck with the select2 GH issue and remove once this is fixed on their side
#
$(document).on 'select2:open', () =>
  document.querySelector('.select2-search__field').focus()

$(document).ready () ->
  $('select').not('.select2-hidden-accessible').select2()
