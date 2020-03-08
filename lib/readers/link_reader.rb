module Link_reader
  def self.read(url)
    data = Nokogiri::XML(open(url))
  end
end
