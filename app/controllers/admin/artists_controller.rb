class Admin::ArtistsController < ApplicationController
  before_action :authenticate_admin!

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			redirect_to admin_artists_path
		else
			render :new
		end
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update(artist_params)
			redirect_to admin_artist_path(@artist.id)
		else
			render :edit
		end
	end

	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
	end

	private

	def artist_params
		params.require(:artist).permit(:artist_name, :opinion, :artist_image)
	end
end
