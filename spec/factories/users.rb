FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    last_name             {"前田"}
    first_name            {"晃佑"}
    last_name_kana        {"マエダ"}
    first_name_kana       {"コウスケ"}
    birthday              {Faker::Date.between(from: "1930-01-01", to: Date.today)}
  end
end