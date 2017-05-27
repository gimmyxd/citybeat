require 'sidekiq'
require 'sidekiq-cron'
require 'open-uri'
class CrawlerJob
  include Sidekiq::Worker

  def perform(url)
   HtmlParser.new(url: url, website: 'OpiniaTimisoarei', project: Project.first).parse
  end
end