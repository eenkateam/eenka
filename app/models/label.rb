class Label < ApplicationRecord
	has_many :products, dependent: :destroy
end
