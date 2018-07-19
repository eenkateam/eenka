class CartsController < ApplicationController

  before_action :authenticate_user!
	def create

	end

	def show
		if Cart.find(params[:id]).user_id == current_user.id
			@cart_products = current_user.cart.cart_products
		else
			redirect_to products_path
		end
	end
end
