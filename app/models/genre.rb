class Genre < ApplicationRecord
    has_many :items, dependent: :destroy
    has_one_attached :image
end
