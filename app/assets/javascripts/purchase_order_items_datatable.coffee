window.formatDiffQ = () ->
  $("td.col-diff_quant").each (_,v) ->
    $v = $(v)
    clazz = if Number($v.html()) == 0 then 'bg-success' else 'bg-warning'
    $v.addClass(clazz)

$(document).ready ->
  formatDiffQ()
  $('.effective-datatable').on 'draw.dt', -> formatDiffQ()

