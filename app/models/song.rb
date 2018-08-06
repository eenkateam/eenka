class Song < ApplicationRecord
	belongs_to :disc, optional: true
	validates :song_name, presence: true
	validates :song_number, presence: true
end
