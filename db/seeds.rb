5.times do
  User.create!(
  email: Faker::Internet.safe_email,
  password: Faker::Internet.password(10, 20, true)
  )
end
users = User.all

15.times do
  List.create!(
    user: users.sample,
    title: Faker::Hacker.noun
  )
end

lists = List.all

50.times do
  Item.create!(
    list: lists.sample,
    description: Faker::Hacker.ingverb
  )
end

User.create!(
  email: 'admin@example.com',
  password: 'helloworld'
)

User.create!(
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
