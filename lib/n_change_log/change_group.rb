module NChangeLog
  class ChangeGroup
    attr_reader :name, :changes

    def initialize(name, changes)
      @name = name
      @changes = changes
    end

    def to_s
      (["#### #{name}"] + changes).join("\n")
    end
  end
end

