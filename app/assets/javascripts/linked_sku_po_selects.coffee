class @LinkedSkuPoSelects
  constructor: (@src, @dst, @available_only=true) ->
    console.debug "Linking #{@src} to #{@dst}"

    $(@src).on 'select2:select', (e) =>

      console.debug "Selection change detected in #{@src}"

      skuid = e.params.data.id

      url   = "/skus/#{skuid}/po_history"

      $(@dst).attr disabled: false

      $(@dst).select2
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
            query.available_only = true if @available_only

            query
          processResults:    (data) -> results: data.items

        templateSelection: (item) -> if(item.selection) then $(item.selection) else item.text
        templateResult: (item) ->
          return item.text if(!item.result)

          $result = $(item.result)
          $result.find('a').on 'mouseup', (e) -> e.stopPropagation()

          $result

