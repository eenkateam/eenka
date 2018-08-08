class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products
		@price = 0
		@order_products.each do |order_product|
			@price += order_product.price * order_product.count
		end
	end

	def index
		@orders = Order.all
	end

	def update
	  	@order = Order.find(params[:id])
	  	if @order.update(order_params)
	  		redirect_to admin_order_path(@order), notice: '配送状況を変更しました。'
	  	else
			@orders = Order.all
	  		render :index
	  	end
  	end

  	private

  	def order_params
  		params.require(:order).permit(:carry_status)
  	end
end
