module NChangeLog
  class Issue
    attr_reader :name, :change_groups

    def initialize(name, change_groups)
      @name = name
      @change_groups = change_groups
    end
  end
end

