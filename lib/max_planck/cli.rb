module MaxPlanck
  module CLI 
    def self.run
      filepath = ARGV.fetch(0) { raise 'Error: A filepath is required as the first argument.'}
      puts "File path: #{ARGV.first}"
      puts 18
    rescue => e
      puts e
    end
  end
end