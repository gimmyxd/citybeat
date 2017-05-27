require 'sidekiq'
require 'sidekiq-cron'
Sidekiq::Cron::Job.create(name: 'My crawler', cron: '0 0 * * *', class: 'CrawlerJob', args: 'http://www.opiniatimisoarei.ro/search/festival') # execute daily at midnight
