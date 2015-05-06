class GfycatPage < SourceParser::SourceBase

  def id
    regex = Regexp.new('([a-z]*$)', Regexp::IGNORECASE)
    match = regex.match(@url)
    puts regex
    puts match
    puts @url
    puts 'heeeeeeeeeeeeeeee'
    match[0]
  end

  def fetch

    uri = URI.parse('http://gfycat.com/cajax/get/' + id)
    req = Net::HTTP::Get.new(uri.to_s)
    res = Net::HTTP.start(uri.host, uri.port) { |http|
      http.request(req)
    }
    
    begin
      JSON.parse(res.body)['gfyItem']['webmUrl']
    rescue
      raise SourceParser::CouldNotParseJSON.new
    end
  end

  def get_url
    fetch
  end

end