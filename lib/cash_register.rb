require 'pry'

class CashRegister
  def initialize(discount = 0, total = 0)
    @total = total
    @discount = discount
    @item = []
  end

  def total=(total)
    @total = total
  end

  def total
    @total
  end

  def discount
    @discount
  end

  def add_item(item, price, quantity = 1)
    @price = price
    quantity.times do
      @item << item
    end
    self.total += price * quantity
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total -= (@total.to_f * @discount.to_f) / 100
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    array_of_items = []
    array_of_items << @item
    array_of_items.flatten
  end

  def void_last_transaction
    @total -= @price
  end

end
