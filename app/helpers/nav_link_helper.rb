module NavLinkHelper
  def nav_link_to(link_path, opts = {})
    klass = opts.fetch(:class, '')
    klass = [klass, active_class(klass)].join(' ') if current_page?(link_path)
    link_to link_path, class: klass do
      yield
    end
  end

  def active_class(klass)
    klass + '--active'
  end
end