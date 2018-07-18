class Cart < ApplicationRecord
	has_many :products, through: :cart_product
	has_many :cart_products
	belongs_to :user
end
