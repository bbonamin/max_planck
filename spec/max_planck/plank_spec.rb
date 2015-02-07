require 'spec_helper'

module MaxPlanck
  describe Plank do
    describe '.from_specs' do
      it 'initializes a plank from it space separated specs' do
        specs = '1 1'
        Plank.from_specs(specs)
        expect(Plank.instance.height).to eq(1)
        expect(Plank.instance.width).to eq(1)
      end
    end
  end
end
