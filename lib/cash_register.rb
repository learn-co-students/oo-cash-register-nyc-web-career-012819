require 'pry'
class CashRegister
  attr_accessor :total, :items
  attr_reader :discount, :total

  def initialize(discount= 0)
    @total = total.to_f
    @discount = discount
    @items = []
    @item_prices = {}
  end

  def add_item(title, price, quantity= 1)
    self.total = total + price*quantity
    quantity.times{
      @items << title
      @item_prices[title] = price
    }


  end

  def apply_discount
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total*@discount)
      return "After the discount, the total comes to $#{total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @item_prices[@items[-1]]
  end

end
