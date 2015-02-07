require 'spec_helper'

module MaxPlanck
  describe Plank do
    describe '.from_specs' do
      it 'initializes a plank from it space separated specs' do
        specs = ['2 3']
        Plank.from_specs(specs)
        expect(Plank.instance.width).to eq(2)
        expect(Plank.instance.height).to eq(3)
      end
    end
  end
end
