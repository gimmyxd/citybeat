class HtmlParser
  attr_accessor :url
  attr_accessor :website
  attr_accessor :project

  def initialize(params)
    @url = params[:url]
    @website = params[:website]
    @project = params[:project]
  end

  def parse
    doc = Nokogiri::HTML(open(url))
    articles = website.constantize.new(doc: doc, project: project).parse
  end

end

