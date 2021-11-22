FactoryBot.define do
  factory :failed_contact do
    card_number = CreditCardValidations::Factory.random

    association :contact_file
    sequence(:id) { |n| }
    name { Faker::Name.name }
    date_of_birth { Faker::Date.between(from: '1940-01-01', to: '2000-12-31') }
    telephone do
      country = Faker::Number.decimal_part(digits: 2)
      number = Faker::Number.number(digits: 10)
      "#{+country}#{number}"
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
