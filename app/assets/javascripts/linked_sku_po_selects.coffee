class @POSelector
  constructor: (@target, url, available_only) ->
    console.debug "Initializing PO selector #{@target} to #{url}"

    $(@target).select2
      minimumResultsForSearch: 0
      allowClear:              true
      placeholder:             'Select...'
      quietMillis:             50
      data:                    [
        id: "null"
        text: ""
      ],
      escapeMarkup: (m) -> m
      ajax:
        url:      url
        dataType: 'json'
        type:     'GET'
        data:     (term) =>
          query                = {}
          query.search         = term
          query.available_only = true if available_only

          query
        processResults:    (data) -> results: data.items

      templateSelection: (item) -> if(item.selection) then $(item.selection) else item.text
      templateResult: (item) ->
        return item.text if(!item.result)

        $result = $(item.result)
        $result.find('a').on 'mouseup', (e) -> e.stopPropagation()

        $result

class @LinkedSkuPoSelects
  constructor: (@src, @dst, @available_only=true) ->
    console.debug "Linking #{@src} to #{@dst}"

    $(@src).change (e) =>
      console.debug "Selection change detected in #{@src}"

      skuid = e.target.value
      url   = "/skus/#{skuid}/po_history"

      $(@dst).attr disabled: false

      new POSelector @dst, url, @available_only
