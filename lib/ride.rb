class Ride
	attr_reader :name,
							:min_height,
							:admission_fee,
							:excitement,
							:total_revenue,
							:rider_log

	def initialize(info)
		@name = info[:name]
		@min_height = info[:min_height]
		@admission_fee = info[:admission_fee]
		@excitement = info[:excitement]
		@total_revenue = 0
		@rider_log = Hash.new(0)
	end

	def board_rider(rider)
		if rider.tall_enough?(min_height) && rider.preferences.include?(excitement)
			rider_log[rider] += 1
			@total_revenue += @admission_fee
			rider.pay_for_ride(@admission_fee)
		else
			'Cannot Board'
		end
	end
 
end
