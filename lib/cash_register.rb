class CashRegister
  attr_accessor :discount,:total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(food,price, quantity=1)
    @last_item = food
    @last_item_price = price
    @total += (price*quantity)
    if quantity > 1
      array = (1..quantity).to_a
      food_array = array.map { |q| food}
      food_array.each do |x|
            @items << x
    end
    else
      @items << food
    end
    @items

  end

  def apply_discount
    if @discount > 0
      @discount = (100-@discount)/100.to_f
      @total = @discount * @total
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

def void_last_transaction

  @total -= @last_item_price
end
end
