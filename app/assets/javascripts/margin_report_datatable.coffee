window.formatRow = () ->
  $("td.col-preordercode").each (_,v) ->
    $v = $(v)

    clazz = switch $v.html()
      when '6', 'C' then 'bg-orange'    # orange
      when '5', 'H' then 'bg-highlight' # highlight-yellow
      when '4', 'D' then 'bg-danger'    # maroon
      when '3', 'N' then 'bg-success'   # green
      when '2', 'S' then 'bg-lightblue disabled'
      when '1', 'E' then 'bg-peach'     # peach

    # $v.addClass(clazz)
    # $v.parents('tr').addClass(clazz)

$(document).ready ->
  formatRow()
  $('.effective-datatable').on 'draw.dt', (e) ->
    formatRow()

    console.log "Drawing dt", e.currentTarget

    $table = $(e.currentTarget)
    $tfoot = $table.find('tfoot').first()
    $row =   $tfoot.children().eq(0)

    if $row
      html1 = $row.children().eq(7).html()
      $('#summary1').html(html1)

      html2 = $row.children().eq(8).html()
      $('#summary2').html(html2)


    undefined
