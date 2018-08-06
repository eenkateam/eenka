class GenresController < ApplicationController
	def show
		@products = Product.without_soft_destroyed.find_by(genre_id: params[:id])
		@genre = Genre.find(params[:id])
	end
end
