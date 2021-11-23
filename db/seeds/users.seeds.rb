puts 'Seeding Users...'

User.create(
  email: 'test1@mail.com',
  password: '12345678'
)

User.create(
  email: 'test2@mail.com',
  password: '12345678'
)

User.create(
  email: 'test3@mail.com',
  password: '12345678'
)

puts 'Users already seed!'
