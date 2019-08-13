FactoryBot.define do
  postal_code = Faker::Number.number(digits: 7)
  address = Gimei.address
  street = Faker::Number.number(digits: 4).to_s + '-' + Faker::Number.number(digits: 3).to_s

  factory :address do
    name { "山田 太郎" }
    postal_code { postal_code }
    prefecture_name { address.prefecture.kanji }
    city { address.city.kanji }
    street { street }
    association :user
  end
end
