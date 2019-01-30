require 'pry'
class CashRegister

attr_accessor :total, :items
attr_reader :total, :discount

  def initialize(discount=0)
    @total = 0.to_f
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    if quantity>1
      i=0
      while i<quantity
        @items << title
        i+=1
      end
    else
      @items << title
    end

    self.total += price*quantity
    @total
    @last_trans = price*quantity
  end

  def apply_discount()
    if @discount > 1
      @discount = @discount/100.to_f
      @total = @total - (@total * @discount)
      # @last_trans = @total
      @total
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction()
        # binding.pry
    @total -= @last_trans

  end

end
