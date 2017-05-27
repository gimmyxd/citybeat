require 'sidekiq'
require 'sidekiq-cron'
require 'open-uri'
class CrawlerJob
  include Sidekiq::Worker

  def perform(url)

    Keyword.all.each do |keyword|
      HtmlParser.new(url: "#{ENV['facebook_url']}+#{keyword}", website: 'Facebook', project: keyword).parse
    end

    Project.all.each do |project|
      project.keywords.split(',').each do |keyword|
        HtmlParser.new(url: "#{url}+#{keyword}", website: 'OpiniaTimisoarei', project: project).parse
      end
        RssFeed.all.each do |feed|
          RssParser.new(feed: feed.url, project: project).parse
        end
    end
  end
end