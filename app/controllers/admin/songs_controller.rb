class Admin::SongsController < ApplicationController
  before_action :authenticate_admin!

	def new
		@song = Song.new
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		if @song.update(song_params)
			redirect_to edit_admin_product_path(song.disc.product)
		else
			render :edit
		end
	end

	def create
		@song = Song.new(song_params)
		@song.disc_id = params[:disc_id]
		if @song.save
			redirect_to admin_product_path(params[:product_id])
		else
			render :new
		end
	end

	def destroy
		song = Song.find(params[:song_id])
		song.destroy
		redirect_to admin_product_path(params[:product_id])
	end

	private

	def song_params
		params.require(:song).permit(:song_name, :song_number)
	end

end
