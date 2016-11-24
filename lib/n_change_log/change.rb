module NChangeLog
  class Change
    attr_reader :description

    def initialize(description)
      @description = description
    end
  end
end

