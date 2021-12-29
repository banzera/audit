import Rails from "@rails/ujs"

# This is the native confirm, showing a browser alert/confirm dialog
nativeConfirm = Rails.confirm

__SkipConfirmation = false

Rails.confirm = (message, element) ->

  showDialog = (element, onConfirm) ->
    options = JSON.parse(element.getAttribute('data-sweet-alert') || '{}')
    message = element.getAttribute('data-confirm')

    Swal.fire(
      title:              'Are you sure?'
      text:               message
      icon:               'warning'
      showCancelButton:   true
      confirmButtonText:  'Confirm'
      confirmButtonColor: '#d33'
      cancelButtonColor:  '#3085d6'
    ).then (result) => onConfirm() if result.isConfirmed

  # JavaScript is single threaded. We can temporarily change this variable
  # in order to skip out of the confirmation logic.
  #
  # When this function returns true, the event (such as a click event) that
  # sourced it is not prevented from executing whatever it was supposed to
  # trigger, such as a form submission, or following a link.
  return true if __SkipConfirmation

  # Here is the logic to determine if a custom dialog should be shown. In
  # this case, we'd expect [data-confirm-dialog="id"] to be present, but
  # other techniques, such as dynamically building a dialog from the
  # [data-confirm] content would also work.
  # return nativeConfirm(message, element) unless element.hasAttribute('data-sweet-alert')

  # This function should be executed when the dialog's positive action is
  # clicked. All it does is re-click the element that was originally
  # triggering this confirmation.
  #
  # Clicking that element will, as expected, re-call Rails.confirm (unless
  # we'd remove [data-confirm] temporarily, which is the alternative solution
  # to this), but because __SkipConfirmation is set, it will bail out early.
  onConfirm = ->
    __SkipConfirmation = true
    element.click()
    __SkipConfirmation = false

  # Here a custom dialog can be shown. use whatever method you like. This
  # hypothetical function shows a dialog.
  #
  showDialog(element, onConfirm)

  # The dialog should, on confirm, call onConfirm()

  # This ensures that the original event that caused this confirmation is
  # swallowed and the action is NOT executed.
  return false

