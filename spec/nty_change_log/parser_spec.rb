require "spec_helper"

describe NTYChangeLog::Parser do
  let(:parser) do
    NTYChangeLog::Parser.new
  end

  describe "#parse_changes" do
    let(:text) do
      return <<-EOS.strip_heredoc
        * dummy1 dummy1 [#1](https://github.com/naoty/nty_change_log/pulls/1)
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
      expect(descriptions).to eq ["dummy1 dummy1", "dummy2"]
    end

    it "returns Changes which have issue" do
      changes = parser.parse_changes(text)
      issue_numbers = changes.map(&:issue).compact.map(&:number)
      expect(issue_numbers).to eq [1]
    end
  end

  describe "#parse_change_groups" do
    let(:text) do
      return <<-EOS.strip_heredoc
        ### Dummy1
        * dummy1

        ### Dummy2
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

  describe "#parse_versions" do
    let(:text) do
      return <<-EOS.strip_heredoc
        ## Unreleased

        ### Dummy1
        * dummy1

        ## 1.0.0

        ### Dummy2
        * dummy2
      EOS
    end

    it "returns Versions" do
      versions = parser.parse_versions(text)
      expect(versions.count).to eq 2
    end

    it "returns Versions which have numbers" do
      versions = parser.parse_versions(text)
      numbers = versions.map(&:name)
      expect(numbers).to eq %w(Unreleased 1.0.0)
    end

    context "when a version has no change groups" do
      let(:text) do
        return <<-EOS.strip_heredoc
          ## Unreleased
        EOS
      end

      it "returns a Version that has empty change_groups" do
        version = parser.parse_versions(text).first
        expect(version.name).to eq "Unreleased"
        expect(version.change_groups.count).to eq 0
      end
    end
  end
end
