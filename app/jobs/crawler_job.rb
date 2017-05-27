require 'sidekiq'
require 'sidekiq-cron'
require 'open-uri'
class CrawlerJob
  include Sidekiq::Worker

  def perform(url)
    # this parses the given URL. returns in doc the full html mark-up of the page.
    # after parsing we return relevant information
    doc = Nokogiri::HTML(open(url))
    byebug
    puts doc

  end
end