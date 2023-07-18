class @LinkedSkuPoSelects
  constructor: (@src, @dst, @available_only=true) ->
    console.log "Linking #{@src} to #{@dst}"

    if val = $(this.src).val() then this.relink(val)

    $(@src).on 'select2:select', (e) =>
      console.log "Selection change detected in #{@src}"
      this.relink(e.params.data.id)

  relink: (skuid) ->
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
        url:      "/skus/#{skuid}/po_history"
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
