require 'singleton'

module MaxPlanck
  class Plank
    include Singleton
    attr_accessor :width, :height

    def self.from_specs(specs)
      specs = specs.split(' ')
      instance.width = Integer(specs.first)
      instance.height = Integer(specs.last)
    end
  end
end
