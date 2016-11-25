module NTYChangeLog
  class Parser
    def parse(text)
      versions = parse_versions(text.strip)
      ChangeLog.new(versions)
    end

    def parse_versions(text)
      result = text.split(/^## (\d+\.\d+\.\d+)$/)[1..-1].map(&:strip)
      Hash[*result].map do |number, issue_texts|
        issues = parse_issues(issue_texts)
        Version.new(number, issues)
      end
    end

    def parse_issues(text)
      result = text.split(/^### (.+)$/)[1..-1].map(&:strip)
      Hash[*result].map do |name, change_group_texts|
        change_groups = parse_change_groups(change_group_texts)
        Issue.new(name, change_groups)
      end
    end

    def parse_change_groups(text)
      result = text.split(/^#### (.+)$/)[1..-1].map(&:strip)
      Hash[*result].map do |name, change_texts|
        changes = parse_changes(change_texts)
        ChangeGroup.new(name, changes)
      end
    end

    def parse_changes(text)
      result = text.split(/^\*\s*(.+)$/).map(&:strip).reject(&:empty?)
      result.map do |description|
        Change.new(description)
      end
    end
  end
end

