require 'sidekiq'
require 'sidekiq-cron'
Sidekiq::Cron::Job.create(name: 'Hard worker - every 5min', cron: '*/1 * * * *', class: 'CrawlerJob') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc