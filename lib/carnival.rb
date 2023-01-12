class Carnival
            attr_reader :rides
  def initialize(time)
    @time = time 
    @rides = []
  end

  def duration 
    "#{@time} days"
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.sort_by {|ride| ride.riders.count}.reverse.first
  end

  def most_profitable_ride 
    @rides.sort_by {|ride| ride.total_revenue}.reverse.first
  end

  def total_revenue_all_rides
    total = 0 
    @rides.each do |ride|
      total += ride.total_revenue
    end
    total 
  end


end