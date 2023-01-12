class Carnival
	attr_reader :duration, :rides

	def initialize(duration)
		@duration = duration
		@rides = []
	end

	def add_ride(ride)
		rides << ride
	end

	def most_popular_ride
		highest_ridden = rides_per_ride.values.max
		rides_per_ride.key(highest_ridden)
	end

	def rides_per_ride
		amount_of_rides = {}
		rides.each do |ride|
			amount_of_rides[ride] = ride.rider_log.values.sum
		end
		amount_of_rides
	end

	def most_profitable_ride
		rides.max_by(&:total_revenue)
	end

	def total_revenue
		rides.sum {|ride| ride.total_revenue}
	end
end