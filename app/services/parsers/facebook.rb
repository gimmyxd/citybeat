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
        params = {
            title: article.css('a').children[1].to_s,
            photo: article.css('a').children[0]['src'],
            status: 'random',
            keywords: project,
            description: article.css('._52eh').children[0].to_s.gsub('\n', ' ').gsub('Ro:', '') +
                "<a href='https://www.facebook.com/" + article.css('a').first['href'] + "'>Facebook Event</a>"
        }
        next unless Project.where(title: article.css('a').children[1].to_s).size==0
        Project.create(params)
      end
    end
  end
end
