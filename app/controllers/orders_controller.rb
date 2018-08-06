class OrdersController < ApplicationController
  before_action :authenticate_user!
	def show
		if Order.find(params[:id]).user_id == current_user.id
			@order = Order.find(params[:id])
			@order_products = @order.order_products
			@price = 0
			@order_products.each do |order_product|
				@price = @price + order_product.price * order_product.count
			end
		else
			redirect_to products_path
		end
	end
end
