class Product < ApplicationRecord
  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :status
  belongs_to       :shipping_burden
  belongs_to       :prefecture
  belongs_to       :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :shipping_day_id
  end

end
