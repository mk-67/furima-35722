class Product < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one          :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :status
  belongs_to       :shipping_burden
  belongs_to       :prefecture
  belongs_to       :shipping_day

  with_options presence: true do
    validates :name,        length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :price,       format: {with: /\A[0-9]+\d/}, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
    validates :image
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_burden_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end
    
end
