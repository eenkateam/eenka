class Product < ApplicationRecord
	attachment :image
	has_many :discs, dependent: :destroy
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_many :cart_products
	has_many :order_products
	has_many :orders,through: :order_products
	has_many :carts,through: :cart_products

	accepts_nested_attributes_for :discs, allow_destroy: true
end
