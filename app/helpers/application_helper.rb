module ApplicationHelper

  def creating_resource?
    action_name.in? %w(new create)
  end

  def default_resource_form(resource=nil, read_only: false, wrapper: :horizontal_form)
    required = read_only ? { required: false } : {}

    simple_form_for (resource || @resource),
      defaults: { disabled: read_only }.merge(required),
      wrapper: wrapper do |f|
        yield f if block_given?
      end
  end

  def flash_to_css_class_mapping(flash_key)
    return 'primary' if flash_key.in? %w(notice)
    return 'danger'  if flash_key.in? %w(alert)
    return flash_key
  end

  def auxiliary_save_button
    content_tag(:button, class: 'btn btn-sm btn-outline-secondary', id: 'auxilary-save-btn') do
      fa_icon :save
    end
  end

  def cancel_button(to = nil, resource = nil)
    resource ||= Effective::Resource.new(controller_path)
    classes = 'cancel btn btn-outline-secondary'

    # default 'to' should be the parent if exists, or the index,
    # or if a symbole resolve the action, or if a string assume a valid path
    #
    to ||= @resource.respond_to?(:parent) ? url_for(@resource.parent) : :index

    path = if to.is_a? Symbol
      resource.action_path(to, @resource)
    else
      to
    end

    unless block_given?
      link_to 'Cancel', path, class: classes
    else
      link_to path, class: classes do
        yield
      end
    end
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
    strict     = opts[:strict]

    active = strict ? (request.fullpath == href) : request.fullpath.include?(href)

    content_tag(:li, class: 'nav-item' ) do
      link_to href, { class: (active ? 'nav-link active' : 'nav-link') } do
        if block_given?
          yield
        else
          fa_icon(icon_class, class: 'nav-icon') + content_tag(:p, label)
        end
      end
    end
  end


end
