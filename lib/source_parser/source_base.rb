module SourceParser
  class SourceBase

    def initialize(url)
      @url = url
    end

    def get_url
      raise WrongImplementation.new("#{self.class} needs to implemtent method `get_url`")
    end

  end
end