class Admin::LabelsController < ApplicationController

	def new
		@label = Label.new
	end

	def create
		label = Label.new(label_params)
		label.save
		redirect_to admin_label_path(label)
	end

	def show
		@label = Label.find(params[:id])
	end

	def index
		@labels = Label.all
	end

	def edit
		@label = Label.find(params[:id])
	end

	def update
		label = Label.find(params[:id])
		label.update(label_params)
		redirect_to admin_label_path(label)
	end

	private

	def label_params
		params.require(:label).permit(:label_name, :opinion)
	end
end