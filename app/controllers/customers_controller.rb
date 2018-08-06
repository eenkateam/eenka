class CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	if User.all != nil
  	  @customers = User.all
  	else
  	end
  end

  def update
  	order = Order.find(params[:order_id])
  	order.update(order_params)
  	redirect_to customer_path(order.user)
  end

  def show
  	@customer = User.find(params[:id])
  	@orders = @customer.orders
  end

  def order_params
  		params.require(:order).permit(:carry_status)
  end
end
