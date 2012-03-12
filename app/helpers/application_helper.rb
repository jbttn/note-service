module ApplicationHelper
  # Devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  # Redcarpet
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(
      hard_wrap: true, filter_html: true),
      no_intra_emphasis: true, autolink: true, fenced_code_blocks: true)
    return markdown.render(text).html_safe
  end
end
