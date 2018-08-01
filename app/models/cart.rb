class Cart < ApplicationRecord
	has_many :cart_products, dependent: :destroy
	has_many :products, through: :cart_products
	has_one :user, dependent: :destroy
	has_one :receiver
end
