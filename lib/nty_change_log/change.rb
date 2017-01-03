module NTYChangeLog
  class Change
    attr_reader :description, :issue

    def initialize(description, issue)
      @description = description
      @issue = issue
    end

    def to_s
      if issue == nil
        "* #{description}"
      else
        "* #{description} #{issue}"
      end
    end
  end
end
