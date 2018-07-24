class Artist < ApplicationRecord
	attachment :artist_image

	has_many :products
end
