class Admin::SongsController < ApplicationController

	def new
		@song = Song.new
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
