class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :cart_item
  has_many :order_details, dependent: :destroy
  has_one_attached :image
end
