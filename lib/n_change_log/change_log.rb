module NChangeLog
  class ChangeLog
    attr_reader :versions

    def initialize(versions)
      @versions = versions
    end

    def to_s
      (["# Change Log"] + versions.map(&:to_s)).join("\n\n")
    end
  end
end

