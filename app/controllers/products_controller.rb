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
		#カートとユーザーを持ってくる
		cart = Cart.find(params[:cart_id])
		user = current_user
		cart_products = cart.cart_products
		#productテーブルの在庫をcartproductに入っている個数分だけ減らす
		products = cart.products
		cart_products.each do |cart_product|
			product = Product.find(cart_product.product_id)
			if product.stock - cart_product.count < 0
				redirect_to cart_path(user.cart)
				return
				#もし在庫がなかったらここで止まってカートに移動して警告文を出してほしい
			end
		end
		#これ以降に来るのは在庫が全部あった場合のみなので、商品をすべて保存する
		cart_products.each do |cart_product|
			product = Product.find(cart_product.product_id)
			product.stock -= cart_product.count
			product.save
		end

		#オーダーにいろいろ代入して保存する
		order = Order.new(order_params)
		order.user_id=user.id
		order.first_name = user.first_name
		order.last_name = user.last_name
		order.first_kana = user.first_kana
		order.last_kana = user.last_kana
		order.postal_code = user.postal_code
		order.adress = user.adress
		order.save

		#cart_productにあったものをorder_productに移してcart_productを消去する
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

	def order_params
  		params.require(:order).permit(:receiver_id)
    end

end

