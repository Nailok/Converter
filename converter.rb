# frozen_string_literal: true

require 'optparse'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'awesome_print'

Options = Struct.new(:name)
class Parser
  def self.parse(options)
    args = Options.new('world')

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: converter [options]'

      opts.on('-i', '--input=FILE', 'File to convert') do |i|
        args.name = i
      end

      opts.on('-o', '--output=FORMAT',
              'Choose one of formats: json, atom, rss') do |i|
        args.name = i
      end

      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        puts '-------------------------'
        puts args.name

        exit
      end
    end.parse!

    opt_parser.parse!(options)
    args
  end
end

# options = Parser.parse %w[--help]

url = 'https://lenta.ru/rss/news'
# url = 'https://news.yandex.ru/cyber_sport.rss'
# url = 'lenta_ru-rss-news.txt'
# url = 'test.txt'
doc = Nokogiri::XML(open(url))
items = []

item_tags = doc.xpath('//item/*').map(&:name).each.uniq
doc.css('item').each do |item|
  parsed_strings = {}
  attr_names = []
  item_tags.each do |tag|
  attr_hash = {}
    if !doc.xpath("//item/#{tag}[@*]").empty?
      attr_names = doc.xpath("//item/#{tag}/@*").map(&:name).each.uniq
      attr_names.each do |att|
        attr_hash[att] = item.css(tag)[0][att]
      end
      parsed_strings[tag] = attr_hash
    else
      item_result = item.css(tag.to_s).text.strip
      parsed_strings[tag] = item_result
   end
  end
  items.push << parsed_strings
end
File.open('output.json', 'w+') { |f| f.write JSON.pretty_generate(items) }

