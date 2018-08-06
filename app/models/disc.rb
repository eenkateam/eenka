class Disc < ApplicationRecord
	has_many :songs, dependent: :destroy
	belongs_to :product, optional: true
	soft_deletable dependent_associations: [:product]
	accepts_nested_attributes_for :songs, allow_destroy: true
	validates :disc_name, presence: true
	validates :disc_number, presence: true
end
