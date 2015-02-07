require 'singleton'

Rectangle = Struct.new(:area)

module MaxPlanck
  class Plank
    include Singleton
    attr_reader :width, :height
    attr_accessor :holes

    def self.from_specs(specs)
      plank_specs = specs.first.split(' ')
      instance.from_plank_specs(plank_specs)

      holes_count = specs[1].to_i
      instance.from_holes_from_specs(holes_count, specs) if holes_count
    end

    def from_plank_specs(plank_specs)
      @width = Integer(plank_specs.first)
      @height = Integer(plank_specs.last)
    end

    def from_holes_from_specs(count, specs)
      @holes = count.times.map do |i|
        coordinates = specs[i + 2].split(' ')
        Hole.new(x: coordinates.first, y: coordinates.last)
      end
    end

    def max_rectangle
      result = 0

      Coordinate.interesting(@holes).each do |coord|
        unchecked_holes = Hole.top_and_right(of: coord, holes: @holes)
        top = height
        loop do
          nearest_hole = Hole.nearest(
            holes: unchecked_holes
          ) || Coordinate.new(width, height)

          area = (nearest_hole.x - coord.x) * (top - coord.y)
          result = area if area > result

          top = nearest_hole.y
          unchecked_holes = unchecked_holes.select { |uh| uh.y < top }

          break if nearest_hole.x == width
        end
      end

      Rectangle.new(result)
    end
  end
end
