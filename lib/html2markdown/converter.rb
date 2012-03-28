require 'nokogiri'
require_relative 'exceptions'

module HTML2Markdown
  module Converter

    def to_markdown string_contents
      raise NoContents unless string_contents!=nil and string_contents.is_a?(String)
      doc = Nokogiri::HTML(string_contents)
      doc.children.map { |ele| parse_element(ele) }.join
    end

    # a normal element
    # maybe text
    # maybe node
    def parse_element(ele)
      if ele.is_a? Nokogiri::XML::Text
        return "#{ele.text}\n"
      else
        if (children = ele.children).count > 0 
          return wrap_node(ele,children.map {|ele| parse_element(ele)}.join )
        else
          return wrap_node(ele,ele.text)
        end
      end
    end

    # wrap node with markdown
    def wrap_node(node,contents=nil)
      result = ''
      contents.strip! unless contents==nil
      # check if there is a custom parse exist
      if respond_to? "parse_#{node.name}"
        return self.send("parse_#{node.name}",node,contents)
      end
      # skip hidden node
      return '' if node['style'] and node['style'] =~ /display:\s*none/
      # default parse
      case node.name.downcase
      when 'i'
      when 'script'
      when 'style'
      when 'li'
        result << "*#{contents}\n"
      when 'blockquote'
        contents.split('\n').each do |part|
          result << ">#{contents}\n"
        end
      when 'strong'
        result << "**#{contents}**\n"
      when 'h1'
        result << "##{contents}\n"
      when 'h2'
        result << "###{contents}\n"
      when 'h3'
        result << "####{contents}\n"
      when 'hr'
        result << "****\n"
      when 'br'
        result << "\n"
      when 'img'
        result << "![#{node['alt']}](#{node['src']})"
      when 'a'
        result << "[#{contents}](#{node['href']})"
      else
        result << contents unless contents == nil
      end
      result
    end

    # define custom node processor
    def method_missing(name,*args,&block)
      self.class.send :define_method,"parse_#{name}" do |node,contents|
        block.call node,contents
      end
    end

    def debug
      puts '----------------------------------'
      puts yield
      puts '----------------------------------'
    end

  end
end
