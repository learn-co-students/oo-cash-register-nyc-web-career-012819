require 'pry'

class CashRegister

attr_accessor :discount, :total, :quantity

def initialize(discount = 0)
  @total = 0
  @discount = discount
  @item = []
end

def add_item(title, price, quantity = 1)
  @total += price * quantity
  @transaction = (price * quantity ) - @discount/100.0

  quantity.times do
      @item << title
  end
end

def apply_discount
  @total = @total - (@discount/100.0 * @total)
  @total *= 1
  if @discount == 0
    "There is no discount to apply."
  else
    "After the discount, the total comes to $#{@total.to_i}."
  end
end

def items
  @item
end

def void_last_transaction
  @total -= @transaction
end

end
