module NTYChangeLog
  class Parser
    def parse(text)
      versions = parse_versions(text.strip)
      ChangeLog.new(versions)
    end

    def parse_versions(text)
      result = text.split(/^## (\w+\.\w+\.\w+)$/)[1..-1].map(&:strip)
      Hash[*result].map do |number, change_group_texts|
        change_groups = parse_change_groups(change_group_texts)
        Version.new(number, change_groups)
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
        match = row.match(/\*\s+(?<description>\S+)(\s+\[#(?<number>\d+)\]\((?<url>.+)\))?$/)
        if match[:number] == nil
          Change.new(match[:description], nil)
        else
          issue = Issue.new(match[:number].to_i, match[:url])
          Change.new(match[:description], issue)
        end
      end
    end
  end
end
