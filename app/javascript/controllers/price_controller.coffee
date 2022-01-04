import { Controller } from "@hotwired/stimulus"

export default class extends Controller
  connect: ->
    console.log "Connected price Controller:", this.qtyValue
    this.qtyValue = this.qtyTarget.value

  updateQty:       (e) -> this.qtyValue = e.target.value
  updatePrice:     (e) -> this.updatePrices(e)

  qtyValueChanged: (e) ->
    this.updatePrices()
    this.updateCalculatedFields()

  priceValueChanged: (e) ->
    this.updateCalculatedFields()

  flashFields: (selector) ->
    $(selector).addClass('bg-info')
    setTimeout ->
      $(selector).removeClass('bg-info')
    , 750

  checkValues: ->
    p = currency(this.priceTarget.value).intValue
    it = currency(this.invoiceNontaxTarget.value).intValue
    $(this.priceTarget).toggleClass('is-invalid', p > it)

  updatePrices: (e) ->
    # if e is nil, this was triggered by a qty change and we should calculate priceper base on price
    [t, v] = if e == undefined or e.target == this.priceTarget
      value  = currency(this.priceTarget.value).divide this.qtyValue
      [this.pricePerTarget, value]
    else
      value  = currency(this.pricePerTarget.value).multiply this.qtyValue
      [this.priceTarget, value]

    $(t).val v
    this.priceValue = this.priceTarget.value
    this.flashFields(t)

  updateTotals: (e) ->
    this.totalTarget.value = _.reduce [
      currency(this.priceTarget.value)
      currency(this.taxTarget.value)
      currency(this.shTarget.value)
      currency(this.feesTarget.value)
      ], (sum, n) -> sum.add n

    this.totalPerTarget.value = _.reduce [
      currency(this.pricePerTarget.value)
      currency(this.taxPerTarget.value)
      currency(this.shPerTarget.value)
      currency(this.feesPerTarget.value)
    ], (sum, n) -> sum.add n

    this.invoiceTotalTarget.value = _.reduce [
      currency(this.invoiceNontaxTarget.value)
      currency(this.invoiceTaxTarget.value)
      currency(this.invoiceShTarget.value)
      currency(this.invoiceFeesTarget.value)
    ], (sum, n) -> sum.add n

  updateCalculatedFields: (e) ->
    console.log "Update to calculated fields triggered by: ", (e.target.id if e != undefined)

    pct_of_order = currency(this.priceTarget.value).divide(this.invoiceNontaxTarget.value)

    this.taxTarget.value   = currency(this.invoiceTaxTarget.value).multiply(pct_of_order)
    this.shTarget.value    = currency(this.invoiceShTarget.value).multiply(pct_of_order)
    this.feesTarget.value  = currency(this.invoiceFeesTarget.value).multiply(pct_of_order)

    this.taxPerTarget.value  = currency(this.taxTarget.value).divide(this.qtyValue)
    this.shPerTarget.value   = currency(this.shTarget.value).divide(this.qtyValue)
    this.feesPerTarget.value = currency(this.feesTarget.value).divide(this.qtyValue)

    this.updateTotals()
    this.flashFields('.calculated')
    this.checkValues()


  @values: {
    qty:   Number
    price: Number
  }

  @targets: [
    "qty"
    "invoiceNontax", "price", "pricePer"
    "invoiceTax",    "tax",   "taxPer"
    "invoiceSh",     "sh",    "shPer"
    "invoiceFees",   "fees",  "feesPer"
    "invoiceTotal",  "total", "totalPer"
  ]