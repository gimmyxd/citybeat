require 'sidekiq'
require 'sidekiq-cron'

Sidekiq::Cron::Job.create(name: 'Crawler', cron: '0 0 * * *', class: 'CrawlerJob', args: 'http://www.opiniatimisoarei.ro/search/') # execute daily at midnight
