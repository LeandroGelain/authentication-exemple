FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
