# Lodash (_)
#= require lodash/lodash
#
#= require currency.js/dist/currency.umd
#
# jQuery
#= require jquery/jquery
#
# Bootstrap 4
#= require bootstrap/js/bootstrap.bundle
#
# Select2
#= require select2/js/select2.full
#
# Bootstrap4 Duallistbox
# require bootstrap4-duallistbox/jquery.bootstrap-duallistbox
#
# InputMask
#= require moment/moment.min
#= require inputmask/jquery.inputmask
#
# date-range-picker
#= require daterangepicker/daterangepicker.js
#
# bootstrap color picker
#= require bootstrap-colorpicker/js/bootstrap-colorpicker
#
# Tempusdominus Bootstrap 4
#= require tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4
#
# Bootstrap Switch
#= require bootstrap-switch/js/bootstrap-switch
#
# BS-Stepper
#= require bs-stepper/js/bs-stepper
#
# dropzonejs
#= require dropzone/dropzone
#
# AdminLTE App
#= require js/adminlte
#
# pace-progress
# BUG: Interferes with RailsUJS Ajax XMLHttpRequest
# require pace-progress/pace
#
# Sweet Alert 2
#= require sweetalert2/sweetalert2
#
# Toastr toast alerts
#= require toastr/toastr.min
#
#= require effective_datatables
#
# NB Enabling effective_bootstrap breaks the Terminus datetimepicker!
# TODO figure out how to make them work together as the following
# contains the effective_form JS used by effectivedatatables inline AJAX submits
# require effective_bootstrap
#= require effective_bootstrap/form
#
#= require chartkick
#= require Chart.bundle
#
#= require datatables
#= require flashes
#= require select2_defaults
#= require tempus_dominus_defaults
#= require linked_sku_po_selects
#
# require_self

$(document).ready () ->
  $('[data-toggle="tooltip"]').tooltip()

$(document).on 'turbolinks:load', ->
  $.fn['PushMenu'].call $('[data-widget="pushmenu"]')

  $('#control-sidebar').click ->
    $('body').toggleClass('dark-mode')
    $('.main-header.navbar').toggleClass('navbar-dark')
