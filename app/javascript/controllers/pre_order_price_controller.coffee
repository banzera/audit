import { Controller } from "@hotwired/stimulus"

export default class extends Controller
  connect: -> console.log "Connected pre-order price Controller:", this.qtyTarget, this.pricePerTarget

  calculate: (e) ->
    console.log "Calculate line total. Triggered by: ", e.target
    this.priceTotalTarget.value = currency(this.pricePerTarget.value || 0).multiply this.qtyTarget.value
    this.flashFields(this.priceTotalTarget)

  flashFields: (selector) ->
    $(selector).addClass('bg-info')
    setTimeout ->
      $(selector).removeClass('bg-info')
    , 750

  @targets: [
    "qty"
    "pricePer"
    "priceTotal"
  ]
