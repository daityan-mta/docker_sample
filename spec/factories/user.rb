FactoryBot.define do
  password = Faker::Internet.password(min_length: 6, max_length: 8)
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
    agreement { Faker::Boolean.boolean }
    # sequence(:name) { |n| "TEST_NAME#{n}"}
    # sequence(:agreement) { |n| "TEST_AGREEMENT#{n}"}
  end
end