# frozen_string_literal: true

require 'nokogiri'

# Main class
class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def run
    data = if @input.match('^https|http')
             Link_reader.read(@input)
           else
             File_reader.read(@input)
           end
    parsed_data = BaseParser.parse(data)
    BaseConverter.convert(parsed_data, @output)


    #if @output.to_s.downcase == 'atom'
      #ConvertToAtom.convert(parsed_data)
      #p 'Output is in atom format'
    #elsif @output.to_s.downcase == 'rss'
      #ConvertToRss.convert(parsed_data)
      #p 'Output is in rss format'
    #elsif @output.to_s.downcase == 'json'
      #ConvertToJson.convert(parsed_data)
      #p 'Output is in json format'
    #end
  end
end
