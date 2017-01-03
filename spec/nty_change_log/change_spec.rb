require "spec_helper"

describe NTYChangeLog::Change do
  describe "#to_s" do
    context "when it doesn't have an issue" do
      let(:change) do
        NTYChangeLog::Change.new("dummy", nil)
      end

      it "returns a text representing the receiver" do
        expect(change.to_s).to eq "* dummy"
      end
    end

    context "when it has an issue" do
      let(:issue) do
        NTYChangeLog::Issue.new(1, "https://github.com/naoty/nty_change_log/pulls/1")
      end

      let(:change) do
        NTYChangeLog::Change.new("dummy", issue)
      end

      it "returns a text representing the receiver" do
        expect(change.to_s).to eq "* dummy [#1](https://github.com/naoty/nty_change_log/pulls/1)"
      end
    end
  end
end
