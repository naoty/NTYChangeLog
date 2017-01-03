module NTYChangeLog
  class Issue
    attr_reader :number, :url

    def initialize(number, url)
      @number = number
      @url = url
    end

    def to_s
      "[##{number}](#{url})"
    end
  end
end
