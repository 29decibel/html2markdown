require_relative 'converter'
require 'open-uri'

class HTMLPage
  include HTML2Markdown::Converter
  attr_accessor :url,:contents

  def initialize(options,&content_extrator)
    @host = options[:host]
    @url = options[:url]
    if (@contents = options[:contents]) == nil
      doc = Nokogiri::HTML(open(@url))
      @contents = doc.at_css('body').send(:inner_html) || doc.inner_html
    end
    @content_extrator = content_extrator
  end

  def markdown
    @markdown ||= markdown!
  end

  def markdown!
    @markdown = to_markdown(contents)
  end

end
