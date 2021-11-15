
toastr.options =
  closeButton:     true
  debug:           false
  progressBar:     true
  positionClass:   "toast-top-right"
  showDuration:    300
  hideDuration:    1000
  timeOut:         5000
  extendedTimeOut: 1000
  showEasing:      "swing"
  hideEasing:      "linear"
  showMethod:      "fadeIn"
  hideMethod:      "fadeOut"

window.flashToast = (flashes) ->

  show = (flash) ->
    types =
      notice:  'success'
      success: 'success'
      alert:   'error'
      error:   'error'
      warning: 'warning'
      info:    'info'

    options =
      notice:  {}
      alert:   { "timeOut": "0", "extendedTimeOut": "0" }
      warning: { "timeOut": "0", "extendedTimeOut": "0" }
      info:    {}

    type = types[flash[0]]
    opts = options[flash[0]]
    msg  = flash[1]

    try
      toastr[type](msg, '', opts)
    catch e
      toastr.info(msg, '', opts)

  show flash for flash in flashes
