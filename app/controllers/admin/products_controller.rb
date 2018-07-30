class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
		@product.discs.build.songs.build
	end

	def edit
	end

	def show
		@product = Product.find(params[:id])
	end

	def index
		@products = Product.all
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
		params
		.require(:product)
		.permit(:product_name, :price, :image, :stock, :artist_id, :genre_id, :label_id,
			:discs_attributes => [:disc_name, :disc_number,
				:songs_attributes => [:song_name, :song_number]
		])
	end
end
