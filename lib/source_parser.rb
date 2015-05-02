require 'source_parser/version'

SOURCE_TYPES_PATH = File.join(File.dirname(__FILE__), 'source_parser', 'source_types', '*.rb')
Dir[SOURCE_TYPES_PATH].each { |file| require file }

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