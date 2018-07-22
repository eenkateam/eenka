class UsersController < ApplicationController
  before_action :authenticate_user!
	def show
		@orders = current_user.orders
		@price = Array.new(current_user.orders.count,0)
		count = 0
		if count < current_user.orders.count
			@orders.each do |order|
				order.order_products.each do |order_product|
					@price[count] = @price[count] + order_product.price * order_product.count

				end
				count += 1
			end
		end
	end
end
