class Product < ApplicationRecord
	attachment :image
	has_many :discs, dependent: :destroy
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_many :cart_products, dependent: :destroy
	has_many :order_products,dependent: :destroy
	has_many :orders,through: :order_products
	has_many :carts,through: :cart_products

	validates :product_name, presence: true
	validates :stock,numericality: { only_integer: true,message: "を数字のみで入力してください" }
	validates :price,numericality: { only_integer: true,message: "を数字のみで入力してください" }

	accepts_nested_attributes_for :discs, allow_destroy: true

	soft_deletable column: :deleted_at
	# set_callback :soft_destroy, :after, :soft_destroy_with_children
	# def soft_destroy_with_children
	#   if self.root? && self.soft_destroyed?
	#     self.live_children.each do |child|
	#       order_product.soft_destroy
	#       disc.soft_destroy
	#       cart_product.soft_destroy
	#     end
	#   end
	# end
end
