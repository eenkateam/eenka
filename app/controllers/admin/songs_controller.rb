class Admin::SongsController < ApplicationController
  before_action :authenticate_admin!

	def new
		@song = Song.new
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		song = Song.find(params[:id])
		song.update(song_params)
		redirect_to edit_admin_product_path(song.disc.product)
	end

	def create
		song = Song.new(song_params)
		song.disc_id = params[:disc_id]
		song.save
		redirect_to admin_product_path(params[:product_id])
	end

	private

	def song_params
		params.require(:song).permit(:song_name, :song_number)
	end

end
