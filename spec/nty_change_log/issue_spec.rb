require "spec_helper"

describe NTYChangeLog::Issue do
  describe "#to_s" do
    let(:issue) do
      NTYChangeLog::Issue.new(1, "https://github.com/naoty/nty_change_log/pulls/1")
    end

    it "returns a text representing the receiver" do
      expect(issue.to_s).to eq "[#1](https://github.com/naoty/nty_change_log/pulls/1)"
    end
  end
end
