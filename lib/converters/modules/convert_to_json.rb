# frozen_string_literal: true

require 'json'

# Class which converts hash data to Json format
module ConvertToJson
  def self.convert(data)
    File.open('output.json', 'w+') { |f| f.write JSON.pretty_generate(data) }
  end
end
