require 'nokogiri'
class Facebook

  attr_accessor :doc
  attr_accessor :project

  def initialize(params)
    @doc = params[:doc]
    @project = params[:project]
  end

  def parse
    divs = doc.xpath('//*[@id="u_0_f"]').children

    divs.each do |hidden_facebook_comment|
      html = hidden_facebook_comment.to_s.gsub('<!--', '').gsub('-->', '')
      html = '<html><body>' + html + '</body></html>'
      doc = Nokogiri::HTML(html)
      articles = doc.xpath('//*[@id="all_search_results"]/div[1]').children
      articles.each do |article|
        link = "https://www.facebook.com/" + article.css('a').first['href']
        event = Nokogiri::HTML(open(link))
        result = parse_single_event(event)
        byebug
        params = {
            title: article.css('a').children[1].to_s,
            photo: result[:image],
            status: 'random',
            keywords: project,
            description: (result[:description] +
                "<a href='#{link.html_safe}'>Facebook Event</a>").html_safe
        }
        next unless Project.where(title: article.css('a').children[1].to_s).size==0
        Project.create(params)
      end
    end
  end

  private

  def parse_single_event(event)
    image = event.css('img').first.attribute('src').to_s

    hidden_facebook_code = event.css('.hidden_elem').children.children.to_s.gsub('<!--', '').gsub('-->', '')
    html = '<html><body>' + hidden_facebook_code + '</body></html>'
    doc = Nokogiri::HTML(html)
    {
      description: doc.css('._2qgs').children.to_s,
      image: image
    }
  end
end
