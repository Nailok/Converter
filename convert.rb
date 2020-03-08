require 'require_all'
require '~/converter/main.rb'

require_all 'lib'
require_all 'bin'

options = Parser.parse
p options
main = Main.new(options)
main.run
#url = 'https://news.yandex.ru/cyber_sport.rss'
#url = 'https://lenta.ru/rss/news'
#url = 'https://lenta.ru/rss'
#url = options[:input]
#doc = Nokogiri::XML(open(url))
#parse_rss = ParseRss.parseRSS(doc)


