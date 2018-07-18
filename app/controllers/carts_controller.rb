class CartsController < ApplicationController

  before_action :authenticate_user!
	def create

	end

	def show
		@cart_products = current_user.cart.cart_products
	end
end
