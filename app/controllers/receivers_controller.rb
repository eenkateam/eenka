class ReceiversController < ApplicationController
	def new
      @receiver = Receiver.new
	end

	def create
		receiver = Receiver.new(receiver_params)
		receiver.user_id = current_user.id
		receiver.save
		redirect_to cart_path(current_user.cart)
	end

	private
	def receiver_params
  		params.require(:receiver).permit(:receiver_name, :receiver_adress)
    end
end
