class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  soft_deletable dependent_associations: [:product]
end
