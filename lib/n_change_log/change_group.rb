module NChangeLog
  class ChangeGroup
    attr_reader :name, :changes

    def initialize(name, changes)
      @name = name
      @changes = changes
    end
  end
end

