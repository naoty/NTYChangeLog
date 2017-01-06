module NTYChangeLog
  class Parser
    def parse(text)
      versions = parse_versions(text.strip)
      ChangeLog.new(versions)
    end

    def parse_versions(text)
      result = text.split(/^## (.+)$/)[1..-1].map(&:strip)
      Hash[*result].map do |name, change_group_texts|
        change_groups = parse_change_groups(change_group_texts)
        Version.new(name, change_groups)
      end
    end

    def parse_change_groups(text)
      result = text.split(/^### (.+)$/)[1..-1].map(&:strip)
      Hash[*result].map do |name, change_texts|
        changes = parse_changes(change_texts)
        ChangeGroup.new(name, changes)
      end
    end

    def parse_changes(text)
      rows = text.split("\n").map(&:strip)
      rows.map do |row|
        if match = row.match(/\[#(?<number>\d+)\]\((?<url>\S+)\)/)
          issue = Issue.new(match[:number].to_i, match[:url])
          description = row.gsub(/\*\s*(.+)\s+\[#\d+\]\(\S+\)$/) { $1 }
          Change.new(description, issue)
        else
          description = row.gsub(/\*\s*(.+)$/) { $1 }
          Change.new(description, nil)
        end
      end
    end
  end
end
