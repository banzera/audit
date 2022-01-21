window.formatDiffQ = () ->
  $("td.col-avail").each (_,avail) ->
    $avail = $(avail)
    $quant = $avail.prev('.col-orderquant2')

    q = Number($quant.html())
    a = Number($avail.html())

    $row = $quant.parents('tr')

    clazz = if a - q >= 0 then 'bg-highlight' else ''

    $row.addClass(clazz)

$(document).ready ->
  formatDiffQ()
  $('.effective-datatable').on 'draw.dt', -> formatDiffQ()

