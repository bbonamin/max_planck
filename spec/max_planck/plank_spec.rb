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

    describe '#max_rectangle' do
      it 'gets the max possible rectangle given holes and a 2x3 plank' do
        Plank.from_specs(['2 3', '1', '1 1'])
        expect(Plank.instance.max_rectangle.area).to eq(4)
      end

      it 'gets the max possible rectangle given holes and a 8x4 plank' do
        Plank.from_specs(['8 4', '3', '1 1', '3 3', '7 2'])
        expect(Plank.instance.max_rectangle.area).to eq(18)
      end

      it 'gets the max possible rectangle given holes and a 20x20 plank' do
        Plank.from_specs(
          ['20 20',
           '12',
           '1 2', '2 1', '3 4', '6 1', '7 3', '15 15',
           '5 5', '10 12', '17 3', '14 8', '5 15', '10 18'])
        expect(Plank.instance.max_rectangle.area).to eq(100)
      end

      it 'returns the plank area if it does not have holes' do
        Plank.from_specs(['8 4'])
        expect(Plank.instance.max_rectangle.area).to eq(32)
      end
    end
  end
end
