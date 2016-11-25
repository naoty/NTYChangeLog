require "spec_helper"

describe NTYChangeLog::Parser do
  let(:parser) do
    NTYChangeLog::Parser.new
  end

  describe "#parse_changes" do
    let(:text) do
      return <<-EOS.strip_heredoc
        * dummy1
        * dummy2
      EOS
    end

    it "returns Changes" do
      changes = parser.parse_changes(text)
      expect(changes.count).to eq 2
    end

    it "returns Changes which have descriptions" do
      changes = parser.parse_changes(text)
      descriptions = changes.map(&:description)
      expect(descriptions).to eq %w(dummy1 dummy2)
    end
  end

  describe "#parse_change_groups" do
    let(:text) do
      return <<-EOS.strip_heredoc
        #### Dummy1
        * dummy1

        #### Dummy2
        * dummy2
      EOS
    end

    it "returns ChangeGroups" do
      change_groups = parser.parse_change_groups(text)
      expect(change_groups.count).to eq 2
    end

    it "returns ChangeGroups which have names" do
      change_groups = parser.parse_change_groups(text)
      names = change_groups.map(&:name)
      expect(names).to eq %w(Dummy1 Dummy2)
    end
  end

  describe "#parse_issues" do
    let(:text) do
      return <<-EOS.strip_heredoc
        ### #1

        #### Dummy1
        * dummy1

        ### #2

        #### Dummy2
        * dummy2
      EOS
    end

    it "returns Issues" do
      issues = parser.parse_issues(text)
      expect(issues.count).to eq 2
    end

    it "returns Issues which have names" do
      issues = parser.parse_issues(text)
      names = issues.map(&:name)
      expect(names).to eq %w(#1 #2)
    end
  end

  describe "#parse_versions" do
    let(:text) do
      return <<-EOS.strip_heredoc
        ## 1.0.0

        ### #1

        #### Dummy1
        * dummy1

        ## 2.0.0

        ### #2

        #### Dummy2
        * dummy2
      EOS
    end

    it "returns Versions" do
      versions = parser.parse_versions(text)
      expect(versions.count).to eq 2
    end

    it "returns Versions which have numbers" do
      versions = parser.parse_versions(text)
      numbers = versions.map(&:number)
      expect(numbers).to eq %w(1.0.0 2.0.0)
    end
  end
end

