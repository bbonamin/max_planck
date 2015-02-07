module MaxPlanck
  module CLI
    def self.run
      filepath = ARGV.fetch(0) do
        fail 'Error: A filepath is required as the first argument.'
      end

      puts "File path: #{filepath}"
      puts 18
    rescue => e
      puts e
    end
  end
end
