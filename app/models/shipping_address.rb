class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code,  format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end
end
