module NChangeLog
  class Issue
    attr_reader :name, :change_groups

    def initialize(name, change_groups)
      @name = name
      @change_groups = change_groups
    end

    def to_s
      (["### #{name}"] + change_groups.map(&:to_s)).join("\n\n")
    end
  end
end

