class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:cart]
	def index
		@products = Product.all
	end
	def show
		@product = Product.find(params[:id])
	end

	def cart
		cart_product=CartProduct.new
		cart_product.cart_id = current_user.cart.id
		cart_product.product_id = params[:product_id]
		cart_product.count=1
		cart_product.save
		redirect_to cart_path(cart_product.cart_id)
	end
end

