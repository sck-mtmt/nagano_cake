class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_many :orders, dependent: :destroy
  has_one_attached :image
end
