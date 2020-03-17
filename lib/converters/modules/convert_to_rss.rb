# frozen_string_literal: true

require 'nokogiri'

# Class which converts hash data to RSS format
module ConvertToRss
  def self.convert(data)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.objects do
        xml.title data[:title]
      end
    end
  end
end
