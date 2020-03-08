class Main
  def initialize(options)
    @input = options[:input]
    @output_format = options[:output]
    @sort = options[:sort]
  end
  
  
  def run
      #data = if @input == 'file' 
                #linkReader.read(@input)
             #else
               #fileReader.read(@input)
             #end
      data = Link_reader.read(@input) 
      parsed_data = ParseRss.parse(data)
      ConvertToJson.convert(parsed_data)
  end
end
