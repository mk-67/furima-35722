FactoryBot.define do
  factory :product do
    name               {Faker::Name.initials(number: 2)}
    description        {"あああ"}
    category_id        {"2"}
    status_id          {"2"}
    shipping_burden_id {"2"}
    prefecture_id      {"2"}
    shipping_day_id    {"2"}
    price              {"10000"}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
