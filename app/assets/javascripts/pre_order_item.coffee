$(document).ready () ->
  $('.sub-selector').click (e) ->
    skuid = $(e.target).data('skuid')
    console.log skuid
    $('#pre_order_item_skuid2').val(skuid).trigger('change')

  updateCode = (_) ->
    id1 = $('#pre_order_item_skuid1').val()
    id2 = $('#pre_order_item_skuid2').val()

    $code = $('#pre_order_item_preorderitemcode')

    val = if id1 == id2 then 1 else 2

    $code.val(val).trigger 'change'

    $s = $code.parent().find('span.select2-selection__rendered')

    $s.addClass('bg-info')
    setTimeout ->
      $s.removeClass('bg-info')
    , 750

  $('#pre_order_item_skuid1, #pre_order_item_skuid2').on 'select2:select', updateCode
  $('#pre_order_item_skuid1, #pre_order_item_skuid2').on 'change', updateCode
