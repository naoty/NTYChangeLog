module NTYChangeLog
  class Change
    attr_reader :description

    def initialize(description)
      @description = description
    end

    def to_s
      "* #{description}"
    end
  end
end

