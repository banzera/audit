class @DropZone
  constructor: (@postback_url,
                @template='#template',
                @previews='#previews',
                @file_types='.csv,.xlsx') ->
    Dropzone.autoDiscover = false

    # Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
    previewNode     = document.querySelector(@template)
    previewNode.id  = ""
    previewTemplate = previewNode.parentNode.innerHTML
    previewNode.parentNode.removeChild(previewNode)

    dz = new Dropzone document.body,  # Make the whole body a dropzone
      url:               @postback_url
      acceptedFiles:     @file_types
      thumbnailWidth:    80
      thumbnailHeight:   80
      parallelUploads:   1
      uploadMultiple:    false
      previewTemplate:   previewTemplate
      autoQueue:         false                # Make sure the files aren't queued until manually added
      previewsContainer: @previews            # Define the container to display the previews
      clickable:         ".fileinput-button"  # Define the element that should be used as click trigger to select files.

    dz.on "success", (file, responseText) ->
      $file = $(file.previewElement)
      $file.find('.btn-group').hide()

      $msg = $file.find('.message')
      $msg[0].innerHTML = responseText.message
      $msg.show()

      $continue = $('a.continue')
      $continue[0].href = responseText.href
      $continue.show()

    dz.on "addedfile", (file) ->
      # Hookup the start button
      file.previewElement.querySelector(".start").onclick = -> dz.enqueueFile(file)

    # Update the total progress bar
    dz.on "totaluploadprogress", (progress) ->
      $("#total-progress .progress-bar")[0].style.width = progress + "%"

    dz.on "sending", (file) ->
      # Show the total progress bar when upload starts
      $("#total-progress")[0].style.opacity = "1"

      # And disable the start button
      file.previewElement.querySelector(".start").setAttribute("disabled", "disabled")

    # Hide the total progress bar when nothing's uploading anymore
    dz.on "queuecomplete", (progress) ->
      $("#total-progress")[0].style.opacity = "0"

    # Setup the buttons for all transfers
    # The "add files" button doesn't need to be setup because the config
    # `clickable` has already been specified.
    $("#actions .start").click = -> dz.enqueueFiles(dz.getFilesWithStatus(Dropzone.ADDED))
    $("#actions .cancel").click = -> dz.removeAllFiles(true)

