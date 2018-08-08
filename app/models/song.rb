class Song < ApplicationRecord
	belongs_to :disc, optional: true
	validates :song_name, presence: true
	validates :song_number,numericality: { only_integer: true,message: "を数字のみで入力してください" }
end
