class ArtistsController < ApplicationController
	def index
		@artist = Artist.all
	end
	def show
		@artist = Artist.find(params[:id])
	end
end
