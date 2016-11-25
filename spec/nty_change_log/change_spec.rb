require "spec_helper"

describe NTYChangeLog::Change do
  describe "#to_s" do
    let(:change) do
      NTYChangeLog::Change.new("dummy")
    end

    it "returns a text representing the receiver" do
      expect(change.to_s).to eq "* dummy"
    end
  end
end

