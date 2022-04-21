import { Controller } from "@hotwired/stimulus"

export default class extends Controller
  connect: ->
    console.log "Connected order price Controller:", this.qtyValue

    this.qtyValue      = this.qtyTarget.value
    this.pricePerValue = this.pricePerTarget.value
    this.taxRateValue  = this.taxRateTarget.value

  updateQty:       (e) -> this.qtyValue      = e.target.value
  updatePrice:     (e) -> this.pricePerValue = e.target.value
  updateTaxRate:   (e) -> this.taxRateValue  = e.target.value

  qtyValueChanged:      (e) -> this.updatePriceTotal()
  pricePerValueChanged: (e) -> this.updatePriceTotal()

  updatePriceTotal: ->
    this.priceTotalTarget.value =
      this.priceTotalValue =
        currency(this.pricePerValue).multiply this.qtyValue

  priceTotalValueChanged: (e) -> this.updateTotals()
  taxRateValueChanged:    (e) -> this.updateTotals()
  taxTotalValueChanged:   (e) -> this.updateTotals()

  flashFields: (selector) ->
    $(selector).addClass('bg-info')
    setTimeout ->
      $(selector).removeClass('bg-info')
    , 750

  updateTotals: (e) ->
    this.taxTotalTarget.value =
      this.taxTotalValue =
        currency(this.priceTotalValue).multiply(this.taxRateTarget.value)

    this.grandTotalTarget.value = _.reduce [
      currency(this.priceTotalTarget.value)
      currency(this.taxTotalTarget.value)
      ], (sum, n) -> sum.add n
    this.flashFields('.calculated')

  @values: {
    qty:        Number
    pricePer:   Number
    priceTotal: Number
    taxRate:    Number
    taxTotal:   Number
    grandTotal: Number
  }

  @targets: [
    "qty"
    "pricePer",
    "priceTotal"
    "taxRate",
    "taxTotal"
    "grandTotal"
  ]
