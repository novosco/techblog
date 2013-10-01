require 'simple-rss'
require 'open-uri'
require 'reverse_markdown'

FEEDS = [
  {:author => 'stejoh', :url => 'http://www.neogeek.net/?feed=rss2'},
  {:author => 'alan', :url => 'http://everythingsysadmin.wordpress.com/feed/'}
]

desc "Synchronise feeds"
task :sync_feeds do
  puts "## Synching dem feeds"
  #status = system("middleman build --clean")
  #puts status ? "OK" : "FAILED"
  FEEDS.each do |feed|
    rss = SimpleRSS.parse open(feed[:url])
    rss.items.each do |entry|
      #puts entry
      slug = "#{entry.pubDate.year}-#{entry.pubDate.month.to_s.rjust(2, '0')}-#{entry.pubDate.day.to_s.rjust(2, '0')}-#{entry.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}"
      
      File.open("./source/#{slug}.markdown", 'w') do |file|
        file.write("---
title: #{entry.title}
date: #{entry.pubDate}
tags: #{entry.category}
author: #{feed[:author]}
---

#{ReverseMarkdown.parse(entry.content_encoded)}

        ")
      end
    end
  end
end

