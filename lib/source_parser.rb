require 'source_parser/version'

require 'net/http'

require 'source_parser/source_base'

Dir[File.join(File.dirname(__FILE__), 'source_parser', 'source_types', '*.rb')].each do |file| 
  require file 
end

module SourceParser

  SOURCE_TYPES_PATTERNS = [
    { klass: GfycatPage, pattern: /(\/\/|www\.)gfycat.com/i }
  ]

  def self.from_url(url)
    match = self.find_source_type(url)
    source = match[:klass].new(url)
    source.get_url
  end

  def self.find_source_type(url)
    SOURCE_TYPES_PATTERNS.find { |h| h[:pattern].match(url) }
  end

end