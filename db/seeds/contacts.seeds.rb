require 'credit_card_validations/string'

after :users, :contact_files do
  puts 'Seeding Contacts...'

  15.times do |i|
    user_id = Faker::Number.between(from: 1, to: 3)
    contact_file_id = Faker::Number.between(from: 1, to: 3)

    name = Faker::Name.name
    date_of_birth = '1990-10-10'

    country = Faker::Number.decimal_part(digits: 2)
    number = Faker::Number.number(digits: 10)
    telephone = "(+#{country})#{number}"

    address = Faker::Address.full_address
    credit_card = CreditCardValidations::Factory.random
    franchise = credit_card.credit_card_brand_name
    email = "#{Faker::Internet.email}#{i}"
    card_last_digits = credit_card[-4..]

    contact = Contact.new(
      user_id: user_id,
      contact_file_id: contact_file_id,
      name: name,
      date_of_birth: date_of_birth,
      telephone: telephone,
      address: address,
      credit_card: credit_card,
      franchise: franchise,
      email: email,
      card_last_digits: card_last_digits
    )

    contact.save!
  end

  puts 'Contacts already seed!'
end
