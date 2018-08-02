class Order < ApplicationRecord
	has_many :order_products, dependent: :destroy
	has_many :products, through: :order_products
	belongs_to :user
	belongs_to :receiver
end
