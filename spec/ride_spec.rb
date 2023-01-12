require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
  context "happy paths for ride" do 
    let(:ride1){Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle })}
    let(:visitor1){Visitor.new('Bruce', 54, '$10')}
    let(:visitor2){Visitor.new('Tucker', 36, '$5')}
    let(:visitor3){Visitor.new('Penny', 64, '$15')}
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

  it "exists as a ride object" do 
    expect(ride1).to be_an_instance_of(Ride)
  end 

  it "has various attributes" do 
    expect(ride1.name).to eq("Carousel")
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)

  end

  it "starts out with no revenue per ride" do 
    expect(ride1.total_revenue).to eq(0)
  end

  it "creates a log of the riders" do 

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(ride1.rider_log).to eq({
      visitor1 => 2, 
      visitor2 => 1
    })
  end

  it "reduces the spending money of the riders each time they board the ride" do 
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(visitor1.spending_money).to eq(8)
    expect(visitor2.spending_money).to eq(4)

  end

  it "increases the total revenue for the ride by the amount the visitors have purchased in entrance tickets" do 
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(ride1.total_revenue).to eq(3)
  end

  it "ride2 and ride3 are instances of the Ride object" do 
    expect(ride2).to be_an_instance_of(Ride)
    expect(ride3).to be_an_instance_of(Ride)

  end

  it "can check their spending money again" do
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
    visitor3.add_preference(:thrilling)
    visitor2.add_preference(:thrilling)
    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(visitor1.spending_money).to eq(8)
    expect(visitor2.spending_money).to eq(4)
    expect(visitor3.spending_money).to eq(13)
  end

  it "creates a rider log for ride 3" do 
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
    visitor3.add_preference(:thrilling)
    visitor2.add_preference(:thrilling)
    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(ride3.rider_log).to eq({
      visitor3 => 1
    })
  end

  it "ride 3 has total revenue of 2 after only one person rode it" do 
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
    visitor3.add_preference(:thrilling)
    visitor2.add_preference(:thrilling)
    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(ride3.total_revenue).to eq(2)
  end


end 
end 