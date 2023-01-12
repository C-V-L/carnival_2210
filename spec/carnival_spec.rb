require './lib/visitor'
require './lib/ride'
require './lib/carnival'


RSpec.describe Carnival do 
  context "happy paths for carnival" do 
    let(:ride1){Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle })}
    let(:visitor1){Visitor.new('Bruce', 54, '$10')}
    let(:visitor2){Visitor.new('Tucker', 36, '$5')}
    let(:visitor3){Visitor.new('Penny', 64, '$15')}
    let(:visitor4){Visitor.new('Jack', 25, '$15')}
    let(:visitor5){Visitor.new('Hady', 70, '$15')}
    let(:visitor6){Visitor.new('Malena', 65, '$15')}
    let(:ride2){Ride.new({ 
      name: 'Ferris Wheel', 
      min_height: 36, 
      admission_fee: 5, 
      excitement: :gentle })}
    let(:ride3){Ride.new({
      name: 'Roller Coaster', 
      min_height: 54, 
      admission_fee: 2, 
      excitement: :thrilling})}
    let(:carnival1){Carnival.new(3)}
    let(:carnival2){Carnival.new(5)}

  it "exists as an object Carnival" do 
    expect(carnival1).to be_an_instance_of(Carnival)
    expect(carnival2).to be_an_instance_of(Carnival)
  end


  it "has a duration" do 
    expect(carnival1.duration).to eq("3 days")
    expect(carnival2.duration).to eq("5 days")

  end 

  it "has rides at the Carnival" do 
  
    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival2.add_ride(ride3)

    expect(carnival1.rides).to match_array([ride1, ride2])
    expect(carnival2.rides).to match_array([ride3])

  end 

  it "has the most popular ride at carnival1" do 

    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor3.add_preference(:thrilling)
    visitor4.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride2.board_rider(visitor1)
    ride3.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor2)
    ride3.board_rider(visitor2)
    ride1.board_rider(visitor3)
    ride2.board_rider(visitor3)
    ride3.board_rider(visitor3)
    ride1.board_rider(visitor4)
    ride2.board_rider(visitor4)
    ride3.board_rider(visitor4)

    expect(carnival1.most_popular_ride).to eq(ride1)
  end 

  it "has the most popular ride at carnival1" do 

    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)
    visitor1.add_preference(:thrilling)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor4.add_preference(:thrilling)
    ride1.board_rider(visitor1)
    ride2.board_rider(visitor1)
    ride3.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor2)
    ride3.board_rider(visitor2)
    ride1.board_rider(visitor3)
    ride2.board_rider(visitor3)
    ride3.board_rider(visitor3)
    ride1.board_rider(visitor4)
    ride2.board_rider(visitor4)
    ride3.board_rider(visitor4)

    expect(carnival1.most_popular_ride).to eq(ride3)
  end 

  it "has the most profitable ride at the carnival" do 

      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride3.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor2)
      ride3.board_rider(visitor2)
      ride1.board_rider(visitor3)
      ride2.board_rider(visitor3)
      ride3.board_rider(visitor3)
      ride1.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride3.board_rider(visitor4)
  
      expect(carnival1.most_profitable_ride).to eq(ride2)
    end 

    it "has the most profitable ride at the carnival" do 

      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)
      visitor5.add_preference(:thrilling)
      visitor6.add_preference(:thrilling)
      ride1.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride3.board_rider(visitor1)

      ride1.board_rider(visitor2)
      ride2.board_rider(visitor2)
      ride3.board_rider(visitor2)
      
      ride1.board_rider(visitor3)
      ride2.board_rider(visitor3)
      ride3.board_rider(visitor3)
      
      ride1.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride3.board_rider(visitor4)

      ride1.board_rider(visitor5)
      ride2.board_rider(visitor5)
      ride3.board_rider(visitor5)
  
      ride1.board_rider(visitor6)
      ride2.board_rider(visitor6)
      ride3.board_rider(visitor6)

      expect(carnival1.most_profitable_ride).to eq(ride3)
    end 

    it "can calculate all the revenue from all the rides" do 
      
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)
      visitor5.add_preference(:thrilling)
      visitor6.add_preference(:thrilling)
      ride1.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride3.board_rider(visitor1)

      ride1.board_rider(visitor2)
      ride2.board_rider(visitor2)
      ride3.board_rider(visitor2)
      
      ride1.board_rider(visitor3)
      ride2.board_rider(visitor3)
      ride3.board_rider(visitor3)
      
      ride1.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride3.board_rider(visitor4)

      ride1.board_rider(visitor5)
      ride2.board_rider(visitor5)
      ride3.board_rider(visitor5)
  
      ride1.board_rider(visitor6)
      ride2.board_rider(visitor6)
      ride3.board_rider(visitor6)

      expect(carnival1.total_revenue_all_rides).to eq(12)

    end
  end
end 