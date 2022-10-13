class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :image

  def active_for_authentication?
    super && (is_deleted == false)
  end
  def address_display_1
    '〒' + postal_code + address
  end
  def address_display_2
    last_name + first_name
  end
end
