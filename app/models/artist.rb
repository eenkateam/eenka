class Artist < ApplicationRecord
	attachment :artist_image
	has_many :products, dependent: :destroy
	validates :artist_name, presence: true
	validates :opinion, presence: true
end
