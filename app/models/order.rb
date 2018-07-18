class Order < ApplicationRecord
	has_many :products, through: :order_products
	has_many :order_products
	belongs_to :user
end
