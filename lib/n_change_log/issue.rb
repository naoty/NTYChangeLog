module NChangeLog
  class Issue
    attr_reader :change_groups

    def initialize(change_groups)
      @change_groups = change_groups
    end
  end
end

