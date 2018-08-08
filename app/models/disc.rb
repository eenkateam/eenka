class Disc < ApplicationRecord
	has_many :songs, dependent: :destroy
	belongs_to :product, optional: true
	soft_deletable dependent_associations: [:product]
	accepts_nested_attributes_for :songs, allow_destroy: true
	validates :disc_name, presence: true
	validates :disc_number,numericality: { only_integer: true,message: "を数字で入力してください" }
end
