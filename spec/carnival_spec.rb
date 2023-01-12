require './lib/visitor'
require './lib/ride'
require './lib/carnival'

describe Carnival do
  let(:carnival) { Carnival.new(3) }

	let(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
	let(:ride2) {Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
	let(:ride3) {Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}
	
	let(:visitor1) {Visitor.new('Bruce', 54, '$10')}
	let(:visitor2) {Visitor.new('Tucker', 36, '$5')}
	let(:visitor3) {Visitor.new('Penny', 64, '$15')}
	let(:visitor4) {Visitor.new('Tina', 36, '$5')}

	before do
		visitor1.add_preference(:gentle)
		visitor2.add_preference(:gentle)
		visitor2.add_preference(:thrilling)
		visitor3.add_preference(:thrilling)

		ride1.board_rider(visitor1)
		ride1.board_rider(visitor2)
		ride1.board_rider(visitor1)

		ride3.board_rider(visitor1)
		ride3.board_rider(visitor2)
		ride3.board_rider(visitor3)
	end

	describe '#initialize' do
		it 'exists' do
			expect(carnival).to be_a(Carnival)
		end

		it 'has attributes' do
			expect(carnival.duration).to eq(3)
			expect(carnival.rides).to eq([])
		end
	end

	context 'add rides to carnival' do
		before do
			carnival.add_ride(ride1)
			carnival.add_ride(ride2)
			carnival.add_ride(ride3)
		end

		describe '#add_ride' do
			it 'adds a ride' do
				expect(carnival.rides).to eq([ride1, ride2, ride3])
			end
		end

		describe '#rides_per_ride' do
			it 'returns a hash with ride as key and amount of times ridden as value' do
				expect(carnival.rides_per_ride).to eq({ride1 => 3, ride2 => 0, ride3 => 1})
			end
		end

		describe '#most_popular_ride' do
			it 'returns the most popular ride' do
				expect(carnival.most_popular_ride).to eq(ride1)
			end
		end

		describe '#most_profitable_ride' do
			it 'returns the most profitable ride' do
				expect(carnival.most_profitable_ride).to eq(ride1)

				ride2.board_rider(visitor1)

				expect(carnival.most_profitable_ride).to eq(ride2)
			end
		end

		describe '#total_revenue' do
			it 'returns the total' do
				expect(carnival.total_revenue).to eq(5)

				ride2.board_rider(visitor1)

				expect(carnival.total_revenue).to eq(10)
			end
		end
	end
end