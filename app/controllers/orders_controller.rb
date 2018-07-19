class OrdersController < ApplicationController
	def show
		if Order.find(params[:id]).user_id == current_user.id
			@order_products = Order.find(params[:id]).order_products
		else
			redirect_to products_path
		end
	end
end
