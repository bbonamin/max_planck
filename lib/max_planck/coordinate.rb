module MaxPlanck
  Coordinate = Struct.new(:x, :y) do
    def self.interesting(holes)
      x_coords = [0] + holes.map(&:x)
      y_coords = [0] + holes.map(&:y)
      x_coords.product(y_coords).map do |coords|
        new(coords.first, coords.last)
      end
    end
  end
end
