require 'credit_card_validations/string'

FactoryBot.define do
  factory :contact do
    card_number = CreditCardValidations::Factory.random

    association :user
    association :contact_file
    sequence(:id) { |n| }
    name { Faker::Name.name }
    date_of_birth { '1990-10-10' }
    telephone do
      country = Faker::Number.decimal_part(digits: 2)
      number = Faker::Number.number(digits: 10)
      "(+#{country})#{number}"
    end
    address { Faker::Address.full_address }
    credit_card { card_number }
    franchise { card_number.credit_card_brand_name }
    sequence(:email) { |n| "#{Faker::Internet.email}#{n}" }
    card_last_digits { card_number[-4..] }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
