require 'json'

file = File.open("output.json")
file_data = file.readlines.map(&:chomp)
my_hash = JSON.parse(file_data)

#p my_hash
