module NChangeLog
  class Version
    attr_reader :number, :issues

    def initialize(number, issues)
      @number = number
      @issues = issues
    end

    def to_s
      (["## #{number}"] + issues.map(&:to_s)).join("\n\n")
    end
  end
end
