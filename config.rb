# Blog settings
###

Time.zone = "UTC"

activate :blog do |blog|
  # blog.prefix = "blog"
  blog.permalink = ":year:month:day-:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  blog.taglink = ":tag.html"
  blog.layout = "post"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  #blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

page "/feed.xml", :layout => false

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

data.authors.each_with_index do |author_array, i|
  author = author_array[1]
  proxy "/#{author['slug']}.html", '/templates/author_template.html', :locals => { :author => author }
end
ignore "/templates/author_template.html"

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def app_name
    "Novosco Tech Blog"
  end

  def author_link(author_id)
    link_to data.authors[author_id].name, "/#{data.authors[author_id].slug}"
  end

  def avatar_for(author_id)
    image_tag(data.authors[author_id].avatar)
  end

  def articles_by(author)
    blog.articles.select { |a| a.data.author == author.twitter }
  end

  def featured_article
    blog.articles.first
  end

  def blog_tag(tag, articles_size=nil)
    size = articles_size.nil? ? "" : " (#{articles_size})"
    link_to "#{tag}#{size}", tag_path(tag), :class => "tag"
  end
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote = "custom-remote" # remote name or git url, default: origin
  # deploy.branch = "custom-branch" # default: gh-pages

  deploy.build_before = true # default: false
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :haml, { ugly: true }

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets

  activate :gzip
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :syntax
activate :directory_indexes
