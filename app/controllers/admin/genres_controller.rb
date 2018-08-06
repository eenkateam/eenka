class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

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
