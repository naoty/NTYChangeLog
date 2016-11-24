module NChangeLog
  class ChangeLog
    attr_reader :versions

    def initialize(versions)
      @versions = versions
    end
  end
end

