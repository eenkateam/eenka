class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def edit
	end

	def index
	end

	def update
	end

	def create
		product = Product.new(product_params)
		product.save
		redirect_to admin_products_path
	end

	private

	def product_params
		params.require(:product).permit(:product_name, :price, :image, :stock)
	end
end