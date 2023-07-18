$(document).ready () -> new LinkedSkuPoSelects('#pre_order_item_skuid2', '#pre_order_item_poid')

$('#accept-suggested-price').click (e) ->
  e.preventDefault()
  $el = $('#pre_order_item_orderpriceper2')
  $el.val($('#pre_order_item_suggested_price').val()).flash()

  window.Stimulus.controllers[1].calculate($el[0])

$('#pre_order_item_poid').on 'select2:select', (e) =>
  price = currency(e.params.data.price)
  $('#pre_order_item_orderaupriceper').val(price).flash()
  $('#pre_order_item_suggested_price').val(price.multiply(1.0)).flash()

# check for same/different SKU selection and update code and proposed qty as appropriate
$('#pre_order_item_skuid1, #pre_order_item_skuid2').on 'select2:select', (e) =>
  id1 = $('#pre_order_item_skuid1').select2('data')[0].id
  id2 = $('#pre_order_item_skuid2').select2('data')[0].id

  if id1 == id2
    newVal = $('#pre_order_item_orderquant1').val()
    $el = $('#pre_order_item_orderquant2').val(newVal).flash()

    window.Stimulus.controllers[1].calculate($el[0])

  if id2
    val = if id1 == id2 then 1 else 2

    $code = $('#pre_order_item_preorderitemcode')
    $code.val(val).trigger 'change'

    $s = $code.parent().find('span.select2-selection__rendered').flash()

# check that selected SKU is on the "NEVER" list...
$('#pre_order_item_skuid2').on 'select2:select', (e) =>
  skuid = Number($('#pre_order_item_skuid2').select2('data')[0].id)

  infos = $(document).prop("SKU_INFOS")

  info = infos.find (i) ->
    i.skuid == skuid

  $hint = $('.pre_order_item_sku2 > small.form-text')
  $s2   = $('.pre_order_item_sku2 > span > span.selection > span.select2-selection')
  $hint.removeClass 'bg-danger'
  $s2.removeClass 'bg-danger'

  msg = if info
    # $hint.addClass 'bg-danger'
    $s2.addClass 'bg-danger'
    info.skucustnotes
  else
    "No customer-specific SKU info for #{skuid}"

  $('.pre_order_item_sku2 > small.form-text').html(msg)
