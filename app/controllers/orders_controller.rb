class OrdersController < ApplicationController
	def show
		# これちょっと微妙化も行こうと思えば自分なら過去の中もご画面に飛べてしまう
		if Order.find(params[:id]).user_id == current_user.id
			@order = Order.find(params[:id])
			@order_products = @order.order_products
			@price = 0
			@order_products.each do |order_product|
				@price = @price + order_product.price * order_product.count
			end
		else
			redirect_to products_path
		end
	end
end
