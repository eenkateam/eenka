class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
	def new
		@product = Product.new
		@product.discs.build
	end

	def edit
		@product = Product.find(params[:id])
	end

	def show
		@product = Product.without_soft_destroyed.find(params[:id])
	end

	def index
		@products = Product.without_soft_destroyed.all
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def product_destroy
	  product = Product.find(params[:id])
	  product.soft_destroy
	  redirect_to admin_products_path
	end

	private

	def product_params
		params
		.require(:product)
		.permit(:product_name, :price, :image, :stock, :artist_id, :genre_id, :label_id,
			:discs_attributes => [:id, :disc_name, :disc_number, :_destroy,
				:songs_attributes => [:id, :song_name, :song_number, :_destroy]
		])
	end
end
