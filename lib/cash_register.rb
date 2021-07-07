class CashRegister
  attr_accessor :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end


  def add_item(title , price, opt_qty = 1)
    @price = price
    count = opt_qty
    while count > 0
      self.items << title
      count -= 1
    end
    if opt_qty > 1
      self.total += (price * opt_qty)
    else
      self.total += price
    end
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total -= (self.discount * self.total)/100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    @total -= @price
  end

end
