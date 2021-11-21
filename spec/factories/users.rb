FactoryBot.define do
  factory :user do
    sequence(:id) { |n| }
    sequence(:email) { |n| "#{Faker::Internet.email}#{n}" }
    password { Faker::Internet.password }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
