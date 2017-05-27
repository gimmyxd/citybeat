require 'nokogiri'
class OpiniaTimisoarei

  attr_accessor :doc
  attr_accessor :project

  def initialize(params)
    @doc = params[:doc]
    @project = params[:project]
  end

  def parse
    divs = doc.xpath('/html/body/div[1]/div/div[8]/div[1]')

    divs.each do |articles|
      articles.children.each do |article|
        next if article.css('.title').empty?
        parse_article(article) unless already_exists(article)
      end
    end
  end

  private

  def parse_article(article)
    Article.create(
      title: article.css('.title').css('h3').css('a').children[0].to_s,
      url: article.css('.title').css('h3').css('a[href]').attribute('href').value,
      project: project
    )
  end

  def already_exists(article)
    article_title = article.css('.title').css('h3').css('a').children[0].to_s
    Article.where(:title => article_title).size==0 ? false:true
  end
end
