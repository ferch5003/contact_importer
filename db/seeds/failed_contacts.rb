require 'credit_card_validations/string'

after :users, :contact_files, :contact do
  puts 'Seeding FailedContacts...'

  10.times do |i|
    user_id = Faker::Number.between(from: 1, to: 3)
    contact_file_id = Faker::Number.between(from: 4, to: 5)

    name = Faker::Name.name
    date_of_birth = Faker::Date.between(from: '1940-01-01', to: '2000-12-31')

    country = Faker::Number.decimal_part(digits: 2)
    number = Faker::Number.number(digits: 10)
    telephone = "#{+country}#{number}"

    address = ''
    credit_card = CreditCardValidations::Factory.random
    franchise = credit_card.credit_card_brand_name
    email = "#{Faker::Internet.email}#{i}"
    card_last_digits = credit_card[-4..]

    error_messages = "Address can't be blank"

    failed_contact = FailedContact.new(
      user_id: user_id,
      contact_file_id: contact_file_id,
      name: name,
      date_of_birth: date_of_birth,
      telephone: telephone,
      address: address,
      credit_card: credit_card,
      franchise: franchise,
      email: email,
      card_last_digits: card_last_digits,
      error_messages: error_messages
    )

    failed_contact.save!
  end

  puts 'FailedContacts already seed!'
end
