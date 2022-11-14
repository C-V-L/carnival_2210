class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end

  def add_preference(item)
    @preferences << item
  end

  def tall_enough?(height_variable)
    if @height >= height_variable
      true
    else
      false
    end
  end
end