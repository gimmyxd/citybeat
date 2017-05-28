require 'sidekiq'
require 'sidekiq-cron'
require 'open-uri'
class CrawlerJob
  include Sidekiq::Worker

  def perform(url)
    Keyword.all.each do |keyword|
      HtmlParser.new(url: "https://www.facebook.com/search/events/?q=#{URI.encode(keyword.keyword)}", website: 'Facebook', project: keyword.keyword).parse
    end

    Project.all.each do |project|
      project.keywords.split(',').each do |keyword|
        HtmlParser.new(url: "#{url}#{URI.encode(keyword)}", website: 'OpiniaTimisoarei', project: project).parse
      end
      RssFeed.all.each do |feed|
        RssParser.new(feed: feed.url, project: project).parse
      end
    end
  end
end
