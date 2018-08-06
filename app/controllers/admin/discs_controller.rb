class Admin::DiscsController < ApplicationController
  before_action :authenticate_admin!

	def new
		@disc = Disc.new
	end

  	def create
		@disc = Disc.new(disc_params)
		@disc.product_id = params[:product_id]
		if @disc.save
			redirect_to admin_product_path(params[:product_id])
		else
			render :new
		end
	end

	def edit
		@disc = Disc.find(params[:id])
	end

	def update
		@disc = Disc.find(params[:id])
		@disc.update(disc_params)
		redirect_to admin_product_path
	end

	def destroy
		disc = Disc.find(params[:disc_id])
		disc.destroy
		redirect_to admin_product_path(params[:product_id])
	end

	private

	def disc_params
		params.require(:disc).permit(:disc_name, :disc_number)
	end
end
