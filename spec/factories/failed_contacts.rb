FactoryBot.define do
  factory :failed_contact do
    name { "MyString" }
    date_of_birth { "MyString" }
    telephone { "MyString" }
    address { "MyString" }
    credit_card { "MyString" }
    franchise { "MyString" }
    email { "MyString" }
    card_last_digits { "MyString" }
    errors { "MyText" }
    user { nil }
    contact_file { nil }
  end
end
