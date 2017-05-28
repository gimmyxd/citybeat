require 'sidekiq'
require 'sidekiq-cron'
if ENV['start_cron'] == 'true'
  Sidekiq::Cron::Job.create(name: 'Crawler', cron: '0 0 * * *', class: 'CrawlerJob', args: 'http://www.opiniatimisoarei.ro/search/') # execute daily at midnight
end