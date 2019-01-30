require 'pry'

class CashRegister

	attr_accessor :discount, :title, :price, :total

	def initialize(discount = 0.0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(item, price, quantity = 1)
		# Save transaction details in a hash and push to the items array
		@items.push({item => {
			:price => price,
			:quantity => quantity
		}})

		# Update total
		@total += price * quantity
	end

	def items
		output = []

		# Build array with just the item names
		@items.each do |element|
			element.values[0][:quantity].times do
				output << element.keys[0]
			end
		end

		output
	end

	def void_last_transaction
		# The last item should be the last element in the @items array. Only grab its hash values.
		last_item = @items[-1].values[0]

		# Update total
		# E.g. If 10 tomatoes were added at $5 each, we need to decrement by $50
		@total -= last_item[:price] * last_item[:quantity]

		# Pop the items array to remove the last transaction
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
