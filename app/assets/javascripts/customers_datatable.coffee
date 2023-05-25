window.formatRow = () ->
  $("td.col-billing_mode").each (_,v) ->
    $v   = $(v)
    $row = $v.parents('tr')

    rowClass = switch $v.html()
      when 'monthly', 'S' then 'bg-info'
      when 'savings', 'E' then 'bg-peach'

    $row.addClass(rowClass)

$(document).ready ->
  formatRow()
  $('.effective-datatable').on 'draw.dt', -> formatRow()
