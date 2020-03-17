# frozen_string_literal: true

require 'require_all'
require '~/converter/main.rb'

require_all 'lib'
require_all 'bin'

options = OptionParser.parse
p options
main = Main.new(options)
main.run
