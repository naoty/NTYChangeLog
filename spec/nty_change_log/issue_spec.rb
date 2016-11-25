require "spec_helper"

describe NTYChangeLog::Issue do
  describe "#to_s" do
    let(:changes1) do
      [NTYChangeLog::Change.new("dummy1")]
    end

    let(:changes2) do
      [NTYChangeLog::Change.new("dummy2")]
    end

    let(:change_groups) do
      [
        NTYChangeLog::ChangeGroup.new("Dummy1", changes1),
        NTYChangeLog::ChangeGroup.new("Dummy2", changes2)
      ]
    end

    let(:issue) do
      NTYChangeLog::Issue.new("#1", change_groups)
    end

    it "returns a text representing the receiver" do
      text = <<-EOS.strip_heredoc.strip
        ### #1

        #### Dummy1
        * dummy1

        #### Dummy2
        * dummy2
      EOS
      expect(issue.to_s).to eq text
    end
  end
end

