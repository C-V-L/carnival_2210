require './lib/visitor'
require './lib/ride'


RSpec.describe Visitor do 
  context "happy paths for visitor" do 
  let(:visitor1){Visitor.new('Bruce', 54, '$10')}
  let(:visitor2){Visitor.new('Tucker', 36, '$5')}
  let(:visitor3){Visitor.new('Penny', 64, '$15')}
  let(:ride1){Ride.new({ 
    name: 'Carousel', 
    min_height: 24, 
    admission_fee: 1, 
    excitement: :gentle })}


it "exists as an object Visitor" do 

  expect(visitor1).to be_an_instance_of(Visitor)

end 

it "has attributes include a name, height, and spending money" do 

  expect(visitor1.name).to eq('Bruce')
  expect(visitor1.height).to eq(54)
  expect(visitor1.spending_money).to eq(10)

end 

it "starts out with no preferences" do 

  expect(visitor1.preferences).to eq([])

end 

it "adds some preferences" do 
  visitor1.add_preference(:gentle)
  visitor1.add_preference(:water)

  expect(visitor1.preferences).to eq([:gentle, :water])
end 

it "creates some new visitor objects" do 
  expect(visitor2).to be_an_instance_of(Visitor)
  expect(visitor3).to be_an_instance_of(Visitor)
end 

it "can check if they are tall enough for rides based on a given height threshold" do 
  require 'pry'; binding.pry
  expect(visitor1.tall_enough?(54)).to eq(true)
  expect(visitor2.tall_enough?(54)).to eq(false)
  expect(visitor3.tall_enough?(54)).to eq(true)
  expect(visitor1.tall_enough?(64)).to eq(false)

end 

end 
end 