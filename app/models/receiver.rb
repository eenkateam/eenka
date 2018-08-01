class Receiver < ApplicationRecord
	belongs_to :user
	has_many :orders
	has_one :cart
	validates :receiver_adress, length: { in: 2..50}, presence: true
	validates :receiver_name, length: { in: 2..50}, presence: true
end
