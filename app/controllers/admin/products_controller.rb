class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
		@product.discs.build.songs.build
	end

	def edit
		@product = Product.find(params[:id])
	end

	def show
		@product = Product.find(params[:id])
	end

	def index
		@products = Product.all
	end

	def update
		product = Product.find(params[:id])
		product.update(product_params)
		redirect_to admin_products_path
	end

	def create
		product = Product.new(product_params)
		product.save
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
