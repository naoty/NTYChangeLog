module NChangeLog
  class Version
    attr_reader :number, :issues

    def initialize(number, issues)
      @number = number
      @issues = issues
    end
  end
end
