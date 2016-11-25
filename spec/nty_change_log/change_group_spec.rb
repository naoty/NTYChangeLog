require "spec_helper"

describe NTYChangeLog::ChangeGroup do
  describe "#to_s" do
    let(:changes) do
      [
        NTYChangeLog::Change.new("dummy1"),
        NTYChangeLog::Change.new("dummy2"),
      ]
    end

    let(:change_group) do
      NTYChangeLog::ChangeGroup.new("Dummy", changes)
    end

    it "returns a text representing the receiver" do
      text = <<-EOS.strip_heredoc.strip
        #### Dummy
        * dummy1
        * dummy2
      EOS
      expect(change_group.to_s).to eq text
    end
  end
end

