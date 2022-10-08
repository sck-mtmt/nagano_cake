class CartItem < ApplicationRecord
  belongs_to :customer
  has_many :orders, dependent: :destroy
  belongs_to :item
  has_one_attached :image
end
