class CartsController < ApplicationController

  before_action :authenticate_user!
	def create

	end

	def show
		if Cart.find(params[:id]).user_id == current_user.id
			@cart_products = current_user.cart.cart_products
			@price = 0
			@cart_products.each do |cart_product|
				@price = @price + cart_product.product.price * cart_product.count
			end
			@order = Order.new
			@receiver = Receiver.find_by(user_id: current_user.id)
		else
			redirect_to products_path
		end
	end
end
