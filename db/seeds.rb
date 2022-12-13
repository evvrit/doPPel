require "faker"

puts "cleaning the DB of users and doppelgangers..."
Doppelganger.destroy_all
User.destroy_all
puts "DB is clean!"

puts "making 24 fake doppelgangers..."

User.create(
  email: "a@a.a",
  password: "secret",
  first_name: "Tommy",
  last_name: "Jensen"
)

24.times do User.create(
  email: "#{Faker::Games::Pokemon.name}@doppel.com",
  password: "secret",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
end

# def build_address
#   num = rand(10..100)
#   street = %w[Papineau Laurier Victoria King Queen].sample
#   city = %w[Montreal Toronto Ottawa].sample
#   return num.to_s + " " + street + ", " + city
# end

User.all.each do |user|
  Doppelganger.create(
    name: "#{user.first_name} #{user.last_name}",
    age: rand(21..100),
    gender: rand(1..3),
    address: Faker::Address.full_address,
    rate: rand(20..500),
    bio: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
    user: user
  )
end

# 20.times do Booking.new(
#   start_date: Faker::Date.between(from: Date.today, to: 1.year_from_now)
#   end_date: Faker::Date.between(from: start_date, to: (start_date + rand(0..7))
#   address: Faker::Address.street_address
#   status: rand(0..2)
#   doppelganger_id:
#   user_id:
# )

puts "24 fake doppelgangers created, **not all with valid geocodes -- approx. 83% success rate.**"
# puts "20 fake bookings created."
