require 'rss'
class RssParser

  attr_accessor :feed, :project

  def initialize(params)
    @feed = params[:feed]
    @project = params[:project]
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

      next unless has_keyword?(article.title) || has_keyword?(article.description)

      save_article(
        title: article.title,
        url: article.link,
        project: project_object
      )
    end
  end


  def process_atom_feed
    @rss.items.each do |article|
      next unless has_keyword?(article.title.content) || has_keyword?(article.summary.content)

      save_article(
          title: article.title.content,
          url: article.link.href,
          project: project_object
      )
    end
  end

  def project_object
    @project_object ||=  project.is_a?(Project) ? project : Project.find(project)
  end

  def keywords
    project_object.keywords.split(',')
  end

  def has_keyword?(string)
    keywords.any? { |keyword| string.include?(keyword) }
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