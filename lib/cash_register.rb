require 'pry'
class CashRegister

    attr_accessor :total
    attr_reader :discount, :items
   #attr_writer :

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times { @items << title }
    @last_price = price * quantity
  end

  def apply_discount
    if discount > 0
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_price
  end

end
