module ApplicationHelper

  def default_resource_form(read_only: false)
    simple_form_for @resource,
      defaults: { disabled: read_only }, wrapper: :horizontal_form do |f|
        yield f if block_given?
      end

  end

  def flash_to_css_class_mapping(flash_key)
    return 'primary' if flash_key.in? %w(notice)
    return 'danger'  if flash_key.in? %w(alert)
    return flash_key
  end

  def sidebar_dropdown(label, icon, expanded: false, active: false, &block)
    raise 'expected a block' unless block_given?

    classes = %w[nav-item]
    classes << 'menu-open' if expanded
    content_tag(:li, class: classes.join(' ')) do
      link_classes = %w[nav-link]
      link_classes << 'active' if active
      a = link_to '#', { class: link_classes } do
        cc = "<i class='nav-icon fa fa-icon #{icon}'></i>" +
             "<p>#{label}" +
             "<i class='right fas fa-angle-left'></i></p>"

        cc.html_safe
      end
      ul = content_tag(:ul, class: 'nav nav-treeview') do
        yield
      end

      a + ul
    end
  end

  def sidebar_link_to(object, opts={}, &block)

    unless object.is_a?(String)
      return unless can?(:view, object)
    end

    href = url_for(object)

    icon_class = opts[:icon]  || 'fa-circle'
    label      = opts[:label] || object.model_name.human(count: 2)

    classes = %w[nav-link]
    classes << 'active' if request.fullpath.include?(href)

    content_tag(:li, class: 'nav-item' ) do
      link_to href, { class: classes.join(' ') } do
        block_given? ? yield : "<i class='nav-icon fa fa-icon #{icon_class}'></i> #{label}".html_safe
      end
    end
  end


end
