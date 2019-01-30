require "pry"


class CashRegister

  attr_accessor :discount, :total

  def initialize(discount = nil)
    @items = []
    @discount = discount
    @total = 0
    @item_prices = {}
  end

  def add_item(title, price, quantity = 1)
    @item_prices[title] = price
    @total += price*quantity
    quantity.times do
      @items << title
      @item_prices[title] = price
    end
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
    @total = @total - @total*@discount/100
    "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @item_prices[@items[-1]]
  end

end
