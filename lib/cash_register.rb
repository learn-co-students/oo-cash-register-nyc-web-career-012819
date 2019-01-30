require 'pry'

class CashRegister

attr_accessor :total, :discount

def initialize(discount = 0)
  total = 0
  @total = total
  @discount = discount
  @items = []
  @transaction = []
end

def total=(total)
  @total = total
end

def total
  @total
end


def add_item(item, price, quantity = 1)
  @transaction.push({item => {:price => price, :quantity => quantity }})
  add_price = price * quantity
  @total += add_price
  until quantity == 0
    @items.push(item)
    quantity -= 1
  end

end

def apply_discount
  if @discount == 0
    return "There is no discount to apply."
  else
  @total = @total - (@total * (@discount.to_f/100))
  return "After the discount, the total comes to $#{@total.to_i}."
  end
end

def items
  @items
end


def void_last_transaction
last_trans = (@transaction[-1].values[0][:price]) * (@transaction[-1].values[0][:quantity])
@total -= last_trans
@transaction.pop
end



end
