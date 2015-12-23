#####################################
# Page options, layouts, aliases and
# proxies
#####################################

# Blog
activate :blog do |blog|
  blog.prefix       = "blog"
  blog.permalink    = "{year}/{title}.html"
  blog.sources      = "{year}-{month}-{day}-{title}.html"
  blog.paginate     = true
  blog.per_page     = 10
  blog.tag_template = "blog/tag.html"
  # blog.taglink      = "tags/#{tag}.html"
end

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
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = 'master'
end
