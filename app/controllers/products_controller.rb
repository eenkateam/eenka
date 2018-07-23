class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:cart]
	def index
		@products = Product.all
		@cart_product = CartProduct.new
	end
	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
	end

	def cart
		cart_product=CartProduct.new(cart_product_params)
		cart_product.cart_id = current_user.cart.id
		cart_product.product_id = params[:product_id]
		if cart_product.count != nil
			if current_user.cart.cart_products.find_by(product_id: cart_product.product_id)
				cart_product_update = CartProduct.find_by(cart_id: current_user.cart.id, product_id: cart_product.product_id)
				cart_product_update.count += cart_product.count
				cart_product_update.save
				redirect_to cart_path(cart_product.cart_id)
			else
				cart_product.save
				redirect_to cart_path(cart_product.cart_id)
			end
		else
			redirect_to product_path(params[:product_id]),notice: '枚数を入力してください.'
		end
	end

	def cart_destroy
		cart_product = CartProduct.find(params[:product_id])
		cart_product.destroy
		redirect_to cart_path(params[:cart_id])
	end

	def purchase
		cart = Cart.find(params[:cart_id])
		user = current_user
		order = Order.new
		order.user_id=user.id
		order.receiver_id =1
		order.save
		cart_products = cart.cart_products
		cart_products.each do |cart_product|
			order_product = OrderProduct.new
			order_product.product_id = cart_product.product_id
			order_product.order_id = order.id
			order_product.price = cart_product.product.price
			order_product.count = cart_product.count
			order_product.save
		end
		cart_products.delete_all
		redirect_to order_path(order)
	end

	private

	def cart_product_params
  	params.require(:cart_product).permit(:count)
  end
end

