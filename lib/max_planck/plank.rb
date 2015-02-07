require 'singleton'

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
  end
end
