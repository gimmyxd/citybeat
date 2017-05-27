require 'rss'
class RssParser

  attr_accessor :feed, :keywords

  def initialize(params)
    @feed = params[:feed]
    @keywords = params[:keywords]
  end

  def parse
    initialize_feed
    process_rss_feed if rss?
    process_atom_feed if atom?
  end

  private

  def initialize_feed
    @rss = RSS::Parser.parse(feed, false)
  end

  def process_rss_feed
    @rss.items.each do |article|
      if has_title_keyword?(article.title) && has_content_keyword?(article.content_description)
        save_article({
            title: article.title,
            description: article.description,
            keywords: @matched_keywords,
            status
         "organizer_id"
        "volunteer_id"
           "photo"

                     })
      end
    end
  end

  def process_atom_feed
    @rss.items.each do |article|

    end
  end

  def save_article(properties)
    Article.create(properties)
  end

  def rss?
    @rss.feed_type == 'rss'
  end

  def atom?
    @rss.feed_type == 'atom'
  end

end