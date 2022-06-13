window.formatRow = () ->
  $("td.col-status").each (_,v) ->
    $v = $(v)

    colClass = switch $v.html()
      when 'yellow' then 'bg-highlight'
      when 'red'    then 'bg-danger'
      when 'green'  then 'bg-success'

    $v.addClass(colClass)

$(document).ready ->
  formatRow()
  $('.effective-datatable').on 'draw.dt', -> formatRow()
