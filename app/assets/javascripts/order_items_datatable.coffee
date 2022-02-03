window.formatDiffQ = () ->
  $("td.col-diff_quant").each (_,v) ->
    zero = Number($(v).html()) == 0

    $(v).toggleClass('bg-success', zero)
    $(v).toggleClass('bg-warning', !zero)

  total_outstanding = $("tfoot td.col-diff_quant")[0]
  $total = $(total_outstanding)

  is_zero = Number($total.html()) == 0
  $('#order_orderdelivereddate').toggleClass('is-valid', is_zero)

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
