module MaxPlanck
  class Hole
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = Integer(x)
      @y = Integer(y)
    end
  end
end
