require 'simple-rss'
    require 'open-uri'

FEEDS = [
  'http://www.neogeek.net/?feed=rss2',
  'http://everythingsysadmin.wordpress.com/feed/'
]


desc "Synchronise feeds"
task :sync_feeds do
  puts "## Synching dem feeds"
  #status = system("middleman build --clean")
  #puts status ? "OK" : "FAILED"
  FEEDS.each do |feed_url|
    rss = SimpleRSS.parse open(feed_url)
    puts rss.channel.title
    puts rss.channel.link
    rss.items.each do |entry|
      puts entry.title
      puts entry.pubDate
      puts entry.description
      puts entry.link      
      #puts entry.author    
      #puts entry.summary   
      #puts entry.content   
      #puts entry.published 
      #puts entry.categories
    end
  end
end

