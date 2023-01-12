require './lib/visitor'

describe Visitor do
	let(:visitor1) {Visitor.new('Bruce', 54, '$10')}
	let(:visitor2) {Visitor.new('Tucker', 36, '$5')}
	let(:visitor3) {Visitor.new('Penny', 64, '$15')}

	describe '#initialize' do
		it 'exists' do
			expect(visitor1).to be_a(Visitor)
		end

		it 'has attributes' do
			expect(visitor1.name).to eq('Bruce')
			expect(visitor1.height).to eq(54)
			expect(visitor1.spending_money).to eq(10)
			expect(visitor1.preferences).to eq([])
		end
	end

	describe '#add_preference' do
		it 'adds a new preference' do
			visitor1.add_preference(:gentle)
			visitor1.add_preference(:water)

			expect(visitor1.preferences).to eq([:gentle, :water])
		end
	end

	describe '#tall_enough' do
		it 'returns whether the visitor is tall enough for a given threshold height' do
			expect(visitor1.tall_enough?(54)).to eq(true)
			expect(visitor2.tall_enough?(54)).to eq(false)
			expect(visitor3.tall_enough?(54)).to eq(true)
			expect(visitor1.tall_enough?(64)).to eq(false)
		end
	end

	describe '#pay_for_ride' do
		it 'pays for ride' do
			expect(visitor1.pay_for_ride(1)).to eq(9)
		end
	end

end