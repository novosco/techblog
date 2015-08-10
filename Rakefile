require 'simple-rss'
require 'open-uri'
require 'reverse_markdown'

FEEDS = [
  {:author => 'stejoh', :url => 'http://www.neogeek.net/?feed=rss2'},
  {:author => 'alanmcburney', :url => 'https://everythingsysadmin.wordpress.com/feed/'},
  {:author => 'rainco', :url => 'https://cjrainey.wordpress.com/feed/'}
]

DONT_SYNC = [
  "2012-03-01-started-this-blog-with-good-intentions8230"
]

desc "Synchronise feeds"
task :sync_feeds do
  puts "## Synching dem feeds"
  FEEDS.each do |feed|
    rss = SimpleRSS.parse open(feed[:url])
    rss.items.each do |entry|
      create_post entry, feed[:author]
    end
  end
end


def create_post entry, author
  #puts entry
  slug_date = "#{entry.pubDate.year}-#{entry.pubDate.month.to_s.rjust(2, '0')}-#{entry.pubDate.day.to_s.rjust(2, '0')}"
  slug_title = entry.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug = "#{slug_date}-#{slug_title}"
  return if DONT_SYNC.include? slug

  content = <<tpl
---
title: #{entry.title}
date: #{entry.pubDate}
tags: #{entry.category}
author: #{author}
---

#{ReverseMarkdown.parse(entry.content_encoded)}
tpl

  filename = "./source/#{slug}.markdown"
  File.open(filename, 'w') do |file|
    file.write(content)
  end unless File.file?(filename)
end
