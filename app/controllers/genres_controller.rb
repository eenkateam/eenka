class GenresController < ApplicationController
	def show
		@products = Product.find_by(genre_id: params[:id])
		@genre = Genre.find(params[:id])
	end
end
