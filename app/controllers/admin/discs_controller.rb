class Admin::DiscsController < ApplicationController
	def new
		@disc = Disc.new
	end

  	def create
		disc = Disc.new(disc_params)
		disc.save
		redirect_to admin_products_path
	end

	private

	def disc_params
		params.require(:disc).permit(:disc_name, :disc_number, :product_id)
	end
end
