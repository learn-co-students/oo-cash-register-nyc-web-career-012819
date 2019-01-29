
require 'pry'

class CashRegister

	attr_accessor :discount, :title, :price, :total

	def initialize(discount = 0.0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(item, price, quantity = 1)
		@items.push({item => {
			:price => price,
			:quantity => quantity
		}})
		@total += price * quantity
	end

	def items
		output = []
		@items.each do |element|
			element.values[0][:quantity].times do
				output << element.keys[0]
			end
		end
		output
	end

	def void_last_transaction
		last_transaction_details = @items[-1].values[0]
		@total -= last_transaction_details[:price] * last_transaction_details[:quantity]
		@items.pop
	end

	def apply_discount
		if @discount == 0.0
			return "There is no discount to apply."
		else
			@total = @total*(1 - (@discount.to_f/100))
			return "After the discount, the total comes to $#{@total.to_i}."
		end
	end
end
