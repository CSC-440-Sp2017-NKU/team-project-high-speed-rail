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
end
