module MaxPlanck
  class Hole
    attr_reader :x, :y

    def self.top_and_right(of:, holes:)
      holes.select { |h| h.x > of.x && h.y > of.y }
    end

    def self.nearest(holes:)
      x = holes.map(&:x).min
      holes.detect { |h| h.x == x }
    end

    def initialize(x:, y:)
      @x = Integer(x)
      @y = Integer(y)
    end
  end
end
