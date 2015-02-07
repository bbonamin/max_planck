require 'spec_helper'
module MaxPlanck
  describe Parser do
    before do
      Parser.parse(filepath: 'spec/support/plank-1.txt')
    end

    it 'sets up a Plank instance given a filepath' do
      expect(Plank.instance.width).to eq(8)
      expect(Plank.instance.height).to eq(4)
    end

    it 'sets up Hole instances given a filepath' do
      expect(Plank.instance.holes.count).to eq(3)
      expect(Plank.instance.holes[0].x).to eq(1)
      expect(Plank.instance.holes[0].y).to eq(1)

      expect(Plank.instance.holes[1].x).to eq(3)
      expect(Plank.instance.holes[1].y).to eq(3)

      expect(Plank.instance.holes[2].x).to eq(7)
      expect(Plank.instance.holes[2].y).to eq(2)
    end
  end
end
