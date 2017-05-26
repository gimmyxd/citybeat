require 'rss'
class RssParser
  attribute :feed
  attribute :keyword

  def call
    get_feed
    search_for_keywords
    filter_results
    save_articles
  end

  def get_feed

  end

  def search_for_keywords

  end

  def filter_results

  end

  def save_articles

  end

end