# == Schema Information
#
# Table name: contacts
#
#  id               :bigint           not null, primary key
#  address          :string
#  card_last_digits :string
#  credit_card      :string
#  date_of_birth    :date
#  deleted_at       :datetime
#  email            :string
#  franchise        :string
#  name             :string
#  telephone        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contact_file_id  :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_contacts_on_contact_file_id    (contact_file_id)
#  index_contacts_on_deleted_at         (deleted_at)
#  index_contacts_on_email_and_user_id  (email,user_id) UNIQUE
#  index_contacts_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_file_id => contact_files.id)
#  fk_rails_...  (user_id => users.id)
#
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
