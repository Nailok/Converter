# frozen_string_literal: true

require 'optparse'

class OptionParser
  @options = {}
  def self.parse
    OptionParser.new do |parser|
      parser.on('-i', '--input=FILE',
                'File to convert')

      parser.on('-o', '--output=FORMAT',
                'Choose one of the formats: json, atom, rss')

      parser.on('-h', '--help', 'Prints this help') do
        exit
      end
    end.parse!(into: @options)
    @options
  end
end
