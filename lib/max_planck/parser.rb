module MaxPlanck
  module Parser
    def self.parse(filepath:)
      contents = File.read(filepath).split("\n")

      plank_specs = contents.first
      Plank.from_specs(plank_specs)
    rescue Errno::ENOENT
      raise 'Error: File path is invalid'
    end
  end
end
