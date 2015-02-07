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
  end
end
