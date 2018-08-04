class Admin::DiscsController < ApplicationController
	def new
		@disc = Disc.new
	end

  	def create
		disc = Disc.new(disc_params)
		disc.product_id = params[:product_id]
		disc.save
		redirect_to admin_product_path(params[:product_id])
	end

	def edit
		@disc = Disc.find(params[:id])
	end

	def update
		@disc = Disc.find(params[:id])
		@disc.update(disc_params)
		redirect_to admin_product_path
	end

	private

	def disc_params
		params.require(:disc).permit(:disc_name, :disc_number)
	end
end
