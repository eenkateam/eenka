class Label < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :label_name, presence: true
	validates :opinion, presence: true
end
