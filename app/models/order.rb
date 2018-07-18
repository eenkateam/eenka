class Order < ApplicationRecord
	has_many :prodcts
	belongs_to :user
end
