module MaxPlanck
  class Coordinate
    attr_reader :x, :y

    def initialize(x:, y: 0)
      @x = Integer(x)
      @y = Integer(y)
    end

    def self.interesting(source)
      x_coords = [0] + source.map(&:x)
      y_coords = [0] + source.map(&:y)
      x_coords.product(y_coords).map do |coords|
        new(x: coords.first, y: coords.last)
      end
    end

    def self.top_and_right(of:, source:)
      source.select { |h| h.x > of.x && h.y > of.y }
    end

    def self.nearest(source:, max_width:)
      x = source.map(&:x).min
      source.detect { |h| h.x == x } || new(x: max_width)
    end

    def self.shorter(than:, source:)
      source.select { |h| h.y < than }
    end
  end
end
