class Visitor
	attr_reader :name,
							:height,
							:spending_money,
							:preferences

	def initialize(name, height, spending_money)
		@name = name
		@height = height
		@spending_money = spending_money.gsub('$', '').to_i
		@preferences = []
	end

	def add_preference(preference)
		preferences << preference
	end

	def tall_enough?(height_needed)
		height >= height_needed
	end

	def pay_for_ride(fee)
		@spending_money -= fee
	end

end