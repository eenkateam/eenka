class Admin::ArtistsController < ApplicationController

	def new
		@artist = Artist.new
	end

	def create
		artist = Artist.new(artist_params)
		artist.save
		redirect_to admin_products_path
	end

	private

	def artist_params
		params.require(:artist).permit(:artist_name, :opinion, :artist_image)
	end
end
