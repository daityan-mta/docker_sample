FactoryBot.define do
  # password = Faker::Internet.password(min_length: 6, max_length: 25)
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
    agreement { Faker::Boolean.boolean }
  end
end
