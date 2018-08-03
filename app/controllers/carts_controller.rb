class CartsController < ApplicationController

  before_action :authenticate_user!
	def create

	end

	def show
		if Cart.find(params[:id]).user_id == current_user.id
			@cart_products = current_user.cart.cart_products
			@cart = current_user.cart
			@price = 0
			@cart_products.each do |cart_product|
				@price += cart_product.product.price * cart_product.count
			end
			@order = Order.new
			@receiver_array = []
			current_user.receivers.each do |receiver|
				@receiver_array << [receiver.receiver_name,receiver.id,]
			end
		else
			redirect_to products_path
		end
	end

	def confirm
		if Cart.find(params[:cart_id]).user_id == current_user.id
			@cart_products = current_user.cart.cart_products
			@cart = current_user.cart
			@receiver = Receiver.find(@cart.receiver_id)
			@price = 0
			@cart_products.each do |cart_product|
				@price += cart_product.product.price*cart_product.count
				product = Product.find(cart_product.product_id)
				if product.stock - cart_product.count < 0
					redirect_to cart_path(current_user.cart),:alert => "在庫が足りません"
					return
					#もし在庫がなかったらここで止まってカートに移動して警告文を出してほしい
				end
			end
		else
			redirect_to products_path
		end
	end

	def update
		cart = Cart.find(params[:id])
    	cart.update(cart_params)
    	redirect_to cart_confirm_path(cart)
	end

	def cart_params
  		params.require(:cart).permit(:receiver_id)
    end
end

