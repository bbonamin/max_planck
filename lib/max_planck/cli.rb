module MaxPlanck
  module CLI
    def self.run
      filepath = ARGV.fetch(0) do
        fail 'Error: A filepath is required as the first argument.'
      end

      Parser.parse(filepath: filepath)
      puts Plank.instance.max_rectangle_area
    rescue => e
      puts e
    end
  end
end
