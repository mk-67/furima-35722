class Product < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
    validates :name
    validates :image
  end
end
