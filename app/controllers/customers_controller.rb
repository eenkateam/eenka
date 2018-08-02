class CustomersController < ApplicationController
  def index
  	if User.all != nil
  	  @customers = User.all
  	else
  	end
  end

  def show
  	@customer = User.find(params[:id])
  end
end
