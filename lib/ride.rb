class Ride 
          attr_reader :name, 
                      :min_height, 
                      :admission_fee, 
                      :excitement, 
                      :total_revenue, 
                      :riders
  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @total_revenue = 0 
    @riders = []
    

  end

  def board_rider(rider)
    if rider.tall_enough?(min_height) && rider.preferences.include?(excitement)
      @riders << rider 
      rider.spending_money = rider.spending_money - admission_fee
      @total_revenue += admission_fee
    end 
  end

  def rider_log
    log = Hash.new(0)
    @riders.each do |rider|
      log[rider] += 1
    end
    log
  end
end
