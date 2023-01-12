require './lib/visitor'

RSpec.describe 'Visitor' do

  describe '#initialize' do
    it 'exists' do
      vistor1 = Visitor.new('Bruce', 54, 'S10')
      expect(vistor1).to be_a(Vistor)
      
    end
  end
end