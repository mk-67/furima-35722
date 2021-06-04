FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {2}
    municipality {"横浜"}
    address {"1-1"}
    building_name {"東京ハイツ"}
    phone_number {"01234567890"}
  end
end