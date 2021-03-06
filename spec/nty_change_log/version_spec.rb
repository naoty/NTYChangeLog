require "spec_helper"

describe NTYChangeLog::Version do
  let(:version) do
    NTYChangeLog::Version.new("1.0.0", change_groups)
  end

  describe "#to_s" do
    let(:change_groups) do
      [
        NTYChangeLog::ChangeGroup.new("Dummy1", changes1),
        NTYChangeLog::ChangeGroup.new("Dummy2", changes2),
      ]
    end

    let(:changes1) do
      [
        NTYChangeLog::Change.new("dummy1", issue)
      ]
    end

    let(:changes2) do
      [
        NTYChangeLog::Change.new("dummy2", nil)
      ]
    end

    let(:issue) do
      NTYChangeLog::Issue.new(1, "https://github.com/naoty/nty_change_log/pulls/1")
    end

    it "returns a text representing the receiver" do
      text = <<-EOS.strip_heredoc.strip
        ## 1.0.0

        ### Dummy1
        * dummy1 [#1](https://github.com/naoty/nty_change_log/pulls/1)

        ### Dummy2
        * dummy2
      EOS
      expect(version.to_s).to eq text
    end
  end
end
