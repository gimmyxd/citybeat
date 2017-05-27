require 'sidekiq'
require 'sidekiq-cron'
class CrawlerJob
  include Sidekiq::Worker

  def perform(name, count)
    # do something
  end
end