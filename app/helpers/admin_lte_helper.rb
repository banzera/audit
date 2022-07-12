module AdminLTEHelper

  def lte_card(title: nil, list: {}, style: [:primary, :outline], tools: [], &block)
    raise 'expected a block' unless block_given?

    tool_id = effective_bootstrap_unique_id

    captured = capture(tool_id, &block)

    classes = ['card'] + Array(style).map {|a| a.to_s.prepend 'card-' }

    tools = case tools
    when :all  then TOOL_ICON_MAP.keys
    when :none then Array.new
    else Array(tools)
    end
    content_tag(:div, class: classes.join(' ')) do
      title = content_tag(:h3, title, class: 'card-title') if title.present?

      tools = if tools.any? || content_for?(tool_id)
        content_tag(:div, class: 'card-tools') do
          content_for(tool_id) +
          tools.map {|t| card_tool(t) }.join.html_safe
        end
      end

      header = if title.present? || tools.present?
        content_tag(:div, class: 'card-header') do [title, tools].join.html_safe end
      else
        false
      end

      body = content_tag(:div, captured, class: 'card-body')

      header ? (header + body) : body
    end
  end

  TOOL_ICON_MAP = {
    refresh:  'sync-alt',
    maximize: :expand,
    collapse: :minus,
    remove:   :times,
  }

  def card_tool(widget, data: {})
    icon = TOOL_ICON_MAP[widget] || :tools

    data.reverse_merge!('card-widget' => widget )
    content_tag(:button, fa_icon(icon), type: :button, class: 'btn btn-tool', data: data)
  end

  def card_tool_refresh
    data = {
      "load-on-init"    => "false",
      "source"          => "widgets.html",
      "source-selector" => "#card-refresh-content",
    }

    card_tool(:refresh, data: data)
  end

  def card_with_tabs(active: nil, unique: false, list: {}, content: {}, style: [], &block)
    raise 'expected a block' unless block_given?

    classes = ['card', 'card-tabs'] + Array(style).map {|a| a.to_s.prepend 'card-' }
    content_tag(:div, class: classes.join(' ')) do
      content_tag(:div, class: 'card-header p-0 border-botton-0') do
        @_tab_mode = :tablist
        @_tab_active = (active || :first)
        @_tab_unique = effective_bootstrap_unique_id if unique

        content_tag(:ul, {class: 'nav nav-tabs', role: 'tablist'}.merge(list)) do
          yield # Yield to tab the first time
        end
      end +
      content_tag(:div, class: 'card-body') do
        content_tag(:div, {class: 'tab-content'}.merge(content)) do
          @_tab_mode = :content
          @_tab_active = (active || :first)
          yield # Yield to tab the second time
        end
      end
    end
  end
end
