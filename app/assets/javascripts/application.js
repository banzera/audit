/*
 * require_tree .
 *
 * jQuery
 *= require jquery/jquery
 *
 * Bootstrap 4
 *= require bootstrap/js/bootstrap.bundle
 *
 * Select2
 *= require select2/js/select2.full
 *
 * Bootstrap4 Duallistbox
 * require bootstrap4-duallistbox/jquery.bootstrap-duallistbox
 *
 * InputMask
 *= require moment/moment.min
 *= require inputmask/jquery.inputmask
 *
 * date-range-picker
 *= require daterangepicker/daterangepicker.js
 *
 * bootstrap color picker
 *= require bootstrap-colorpicker/js/bootstrap-colorpicker
 *
 * Tempusdominus Bootstrap 4
 *= require tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4
 *
 * Bootstrap Switch
 *= require bootstrap-switch/js/bootstrap-switch
 *
 * BS-Stepper
 *= require bs-stepper/js/bs-stepper
 *
 * dropzonejs
 *= require dropzone/dropzone
 *
 * AdminLTE App
 *= require js/adminlte
 *
 * Toastr toast alerts
 *= require toastr/toastr.min
 *
 *= require flashes
 *
 * require_self
 */


$(document).ready(function() {
  $('.select2').select2({theme: 'bootstrap4'})

  $('#control-sidebar').click(function() {
    $('body').toggleClass('dark-mode')
    $('.main-header.navbar').toggleClass('navbar-dark')
  })
})
