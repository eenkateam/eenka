class ArtistsController < ApplicationController
	def index
		@artist = Artist.all
	end
	def show
		@artist = Artist.find(params[:id])
		@artistProducts = @artist.products.without_soft_destroyed.page(params[:page]).order("id DESC")
	end
end
