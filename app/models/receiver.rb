class Receiver < ApplicationRecord
	belongs_to :user
	has_many :orders
	has_one :cart
	validates :receiver_adress, presence: true
	validates :receiver_name, presence: true
end
