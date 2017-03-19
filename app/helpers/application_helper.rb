module ApplicationHelper
  
  def parse_markdown(content = '')
    renderer = Redcarpet::Render::HTML.new(escape_html: true)
    markdown = Redcarpet::Markdown.new(renderer, no_intra_emphasis: true,
                                                 autolink:          true,
                                                 tables:            true,
                                                 strikethrough:     true,
                                                 superscript:       true,
                                                 underline:         true,
                                                 highlight:         true)
    markdown.render(content).html_safe
  end
  
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "NKUNet"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  def positive_rating(rating)
    rating >= 0
  end
  
end
