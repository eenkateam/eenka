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
      respond_to do |format|
        if user.update_with_password(user_params)
          # パスワードを変更するとログアウトしてしまうので、再ログインが必要
         sign_in(current_user, bypass: true)
          format.html { redirect_to user_path(user.id) }
        else
          format.html { render :edit }
        end
      end
    end
end
