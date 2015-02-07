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
      instance.holes_from_specs(holes_count, specs) if holes_count
    end

    def from_plank_specs(plank_specs)
      @width = Integer(plank_specs.first)
      @height = Integer(plank_specs.last)
    end

    def holes_from_specs(count, specs)
      @holes = count.times.map do |i|
        coordinates = specs[i + 2].split(' ')
        Hole.new(x: coordinates.first, y: coordinates.last)
      end
    end

    def max_rectangle_area
      Coordinate.interesting(@holes).map do |coord|
        remaining_coords = Coordinate.top_and_right(
          of: coord,
          source: @holes)

        max_height = height
        area = 0

        loop do
          nearest_coord = Coordinate.nearest(
            source: remaining_coords,
            max_width: width)

          remaining_coords = Coordinate.shorter(
            than: nearest_coord.y,
            source: remaining_coords)

          new_area = (nearest_coord.x - coord.x) * (max_height - coord.y)
          area = new_area if new_area > area

          max_height = nearest_coord.y

          break(area) if nearest_coord.x == width
        end
      end.max
    end
  end
end
