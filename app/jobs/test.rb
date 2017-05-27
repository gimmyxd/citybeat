require 'sidekiq'
require 'sidekiq-cron'
Sidekiq::Cron::Job.create(name: 'My crawler', cron: '*/5 * * * *', class: 'CrawlerJob', args: 'http://www.opiniatimisoarei.ro/search/festival') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc

# 0 0 * * * * cron job for daily at midnight