class UsersController < ApplicationController
  before_action :authenticate_user!

	def show
		@orders = current_user.orders
		@price = Array.new(current_user.orders.count,0)
		count = 0
		if count < current_user.orders.count
			@orders.each do |order|
				order.order_products.each do |order_product|
					@price[count] = @price[count] + order_product.price * order_product.count

				end
				count += 1
			end
		end
	end

	def edit
      @user = User.find(params[:id])
      if current_user == @user
      else
    	redirect_to user_path(current_user.id)
      end
    end

    def update
      user = User.find(params[:id])
      user.update(user_params)
      redirect_to user_path(user.id)
    end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_kana, :last_kana, :postal_code, :phone_number, :email, :adress)
  end

end
