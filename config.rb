#####################################
# Page options, layouts, aliases and
# proxies
#####################################

# Blog
activate :blog do |blog|
  blog.prefix       = "blog"
  blog.permalink    = "{year}/{month}/{title}.html"
  blog.sources      = "articles/{year}-{month}-{day}-{title}.html"
  blog.paginate     = true
  blog.per_page     = 10
  blog.tag_template = "blog/tag.html"
end

page "blog/articles/*", layout: :blog_entry

# Per-page layout changes:
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


#####################################
# General configuration
#####################################

# assets
assets_prefix = 'assets'
config[:js_dir]     = "#{assets_prefix}/js"
config[:css_dir]    = "#{assets_prefix}/css"
config[:fonts_dir]  = "#{assets_prefix}/fonts"
config[:images_dir] = "#{assets_prefix}/images"

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  ctivate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end

#####################################
# Helper methods
#####################################

require 'nokogiri'

helpers do

  def blog_summary(html_summary)
    paragraphs = Nokogiri::HTML(html_summary).css('p')

    if paragraphs.empty?
      summary = ""
    else
      summary = paragraphs.first
    end

    return summary
  end

end
