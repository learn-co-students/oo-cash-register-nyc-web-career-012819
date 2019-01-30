class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times { @items << title }
    self.last_transaction = price * quantity
    @total = @total += price * quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total - @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total = @total -= @last_transaction
  end


end
