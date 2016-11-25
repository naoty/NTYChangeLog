require "spec_helper"

describe NTYChangeLog::Version do
  describe "#to_s" do
    let(:changes1) do
      [NTYChangeLog::Change.new("dummy1")]
    end

    let(:changes2) do
      [NTYChangeLog::Change.new("dummy2")]
    end

    let(:change_groups1) do
      [NTYChangeLog::ChangeGroup.new("Dummy1", changes1)]
    end

    let(:change_groups2) do
      [NTYChangeLog::ChangeGroup.new("Dummy2", changes2)]
    end

    let(:issues) do
      [
        NTYChangeLog::Issue.new("#1", change_groups1),
        NTYChangeLog::Issue.new("#2", change_groups2),
      ]
    end

    let(:version) do
      NTYChangeLog::Version.new("1.0.0", issues)
    end

    it "returns a text representing the receiver" do
      text = <<-EOS.strip_heredoc.strip
        ## 1.0.0

        ### #1

        #### Dummy1
        * dummy1

        ### #2

        #### Dummy2
        * dummy2
      EOS
      expect(version.to_s).to eq text
    end
  end
end

