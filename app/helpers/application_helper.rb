module ApplicationHelper
  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    self.output_buffer = render(file: "layouts/#{layout}")
  end

  def inside_layout(layout, &block)
    layout = "layouts/#{layout}" unless layout =~ %r[\Alayouts/]
    content_for :content, capture(&block)
    render template: layout
  end

  def typekit_include_tag(apikey)
    javascript_include_tag("//use.typekit.com/#{apikey}.js") +
    javascript_tag("try{Typekit.load()}catch(e){}")
  end
end
