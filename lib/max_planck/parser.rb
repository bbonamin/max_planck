module MaxPlanck
  module Parser
    def self.parse(filepath:)
      contents = File.read(filepath).split("\n")
      Plank.from_specs(contents)
    rescue Errno::ENOENT
      raise 'Error: File path is invalid'
    end
  end
end
