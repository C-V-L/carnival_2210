require './lib/visitor'

RSpec.describe 'Visitor' do

  let(:visitor1) { Visitor.new('Bruce', 54, '$10')}
  describe '#initialize' do
    it 'exists' do
      expect(visitor1).to be_a(Visitor)
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end

  describe '#add_preference' do
    it 'can add a visitors prefs' do
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)
      expect(visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#tall_enough' do
    it 'can determine if a visitor is tall enough' do
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      expect(visitor1.tall_enough?(54)).to be true
      expect(visitor2.tall_enough?(54)).to be false
      expect(visitor3.tall_enough?(54)).to be true
      expect(visitor1.tall_enough?(64)).to be false
    end
  end
end