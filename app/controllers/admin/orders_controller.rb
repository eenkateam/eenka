class Admin::OrdersController < ApplicationController

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products
		@price = 0
		@order_products.each do |order_product|
			@price += order_product.price * order_product.count
		end
	end

	def index
		@orders = Order.all
	end
end
