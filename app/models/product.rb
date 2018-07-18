class Product < ApplicationRecord
	attachment :image
	has_many :discs
	#belongs_to :artist
	#belongs_to :label
	#belongs_to :genre
	has_many :orders
	has_many :carts
end
