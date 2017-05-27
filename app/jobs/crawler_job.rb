require 'sidekiq'
require 'sidekiq-cron'
class CrawlerJob
  include Sidekiq::Worker

  def perform
    # do something
  end
end