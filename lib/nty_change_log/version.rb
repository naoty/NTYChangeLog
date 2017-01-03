module NTYChangeLog
  class Version
    attr_reader :number, :change_groups

    def initialize(number, change_groups)
      @number = number
      @change_groups = change_groups
    end

    def to_s
      (["## #{number}"] + change_groups.map(&:to_s)).join("\n\n")
    end
  end
end
