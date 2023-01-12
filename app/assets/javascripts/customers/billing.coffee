$(document).ready () ->
  $('.effective_date_time_picker').datetimepicker()

  nextMonth = (start) -> console.log 'next'
  prevMonth = (start) -> console.log 'prev'

  $('#prev, #next').click (e) ->
    $el = $(this)
    drp = $('#range').data('daterangepicker')

    [start, end] = [$el.data('start'), $el.data('end')]

    console.log "Button clicked..."
    console.log start, end

    cb(start,end)
    # drp.setStartDate(start)
    # drp.setEndDate(end)
    # drp.clickApply()

    undefined

  [start, end] = [moment().startOf('month'), moment().endOf('month')]

  cb = (start, end) ->
    console.log "callback invoked..."
    console.log start, end

    $('#prev').data 'start', start.clone().subtract(1, 'month')
    $('#prev').data 'end', end.clone().subtract(1, 'month')

    $('#next').data 'start', start.clone().add(1, 'month')
    $('#next').data 'end', end.clone().add(1,'month')

    $('#range').daterangepicker(
      autoApply: true
      startDate: start
      endDate:   end
      ranges:
        'This Month': [moment().startOf('month'), moment().endOf('month')]
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      , cb)

  cb(start, end)
