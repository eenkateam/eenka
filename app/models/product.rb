class Product < ApplicationRecord
	attachment :image
	has_many :discs
	belongs_to :artist
	#belongs_to :label
	belongs_to :genre
	has_many :orders,through: :order_products
	has_many :carts,through: :cart_products
	has_many :cart_products
	has_many :order_products
end
