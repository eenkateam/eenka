class Song < ApplicationRecord
	belongs_to :disc, optional: true
end
