window.formatRow = () ->
  $("td.col-preorderitemcode,td.col-code").each (_,v) ->
    $v = $(v)

    colClass = switch $v.html()
      when '5', 'H' then 'bg-highlight' # highlight-yellow
      when '4', 'D' then 'bg-danger'    # maroon
      when '3', 'N' then 'bg-success'   # green
      when '2', 'S' then 'bg-lightblue'
      when '1', 'E' then 'bg-peach'     # peach

    $v.addClass(colClass)

$(document).ready ->
  formatRow()
  $('.effective-datatable').on 'draw.dt', -> formatRow()
