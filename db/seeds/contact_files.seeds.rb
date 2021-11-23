require 'open-uri'

after :users do
  puts 'Seeding ContactFiles...'

  5.times do |i|
    user_id = Faker::Number.between(from: 1, to: 3)

    contact_file_url = "https://api.mockaroo.com/api/#{ENV['MOCKAROO_CONTACT_SCHEMA']}?count=5&key=#{ENV['MOCKAROO_KEY']}"

    contact_file = ContactFile.new(
      user_id: user_id
    )
    contact_file.file.attach(
      io: URI.parse(contact_file_url).open,
      filename: "contacts_#{i}.csv"
    )

    contact_file.save!
  end

  puts 'ContactFiles already seed!'
end
