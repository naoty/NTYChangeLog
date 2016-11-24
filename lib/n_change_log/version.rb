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

    def summary
      change_groups = {}

      issues.each do |issue|
        issue.change_groups.each do |change_group|
          change_groups[change_group.name] ||= []
          change_groups[change_group.name] += change_group.changes
        end
      end

      change_group_texts = change_groups.map do |change_group_name, changes|
        (["#### #{change_group_name}"] + changes.map(&:to_s)).join("\n")
      end

      (["## #{number}"] + change_group_texts).join("\n\n")
    end
  end
end
