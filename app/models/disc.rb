class Disc < ApplicationRecord
	has_many :songs, dependent: :destroy
	belongs_to :product, optional: true
	accepts_nested_attributes_for :songs
end
