window.formatDiffQ = () ->
  $("td.col-diff_quant").each (_,v) ->
    $v = $(v)
    clazz = if Number($v.html()) == 0 then 'bg-success' else 'bg-warning'
    $v.addClass(clazz)

$(document).ready ->
  formatDiffQ()
  $('.effective-datatable').on 'draw.dt', -> formatDiffQ()



$(document).on 'ajax:before', (event) ->
  $action = $(event.target)
  $table  = $(event.target).closest('table')

  return true if ('' + $action.data('inline')) == 'false'

  $params = $.param
    _datatable_id:                         $table.attr('id')
    _datatable_attributes:                 $table.data('attributes')
    _datatable_action:                     true
    'order_item[orderitemsdelivereddate]': $('#ship_date').val()

  $action.attr('data-params', $params)
  true
