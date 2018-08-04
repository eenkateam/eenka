class Admin::GenresController < ApplicationController

	def new
		@genre = Genre.new
	end

	def create
		genre = Genre.new(genre_params)
		genre.save
		redirect_to admin_genre_path(genre)
	end

	def show
		@genre = Genre.find(params[:id])
	end

	def index
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		genre = Genre.find(params[:id])
		genre.update(genre_params)
		redirect_to edit_admin_product_path(genre.product)
	end

	private

	def genre_params
		params.require(:genre).permit(:genre_name, :opinion)
	end
end
