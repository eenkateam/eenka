class Receiver < ApplicationRecord
	belongs_to :user
	has_many :orders
	has_one :cart
end
