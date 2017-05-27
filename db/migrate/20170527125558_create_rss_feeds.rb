class CreateRssFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :rss_feeds do |t|
      t.string :url
      t.datetime :last_parsed

      t.timestamps
    end
  end
end
