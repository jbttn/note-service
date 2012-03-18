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
    markdown = Redcarpet::Markdown.new(HTMLwithHighlight.new(
      hard_wrap: true, filter_html: true),
      no_intra_emphasis: true, autolink: true, fenced_code_blocks: true,
      lax_html_blocks: true)
    return markdown.render(text).html_safe
  end
end

class HTMLwithHighlight < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(line_numbers: :table)
  end
end
