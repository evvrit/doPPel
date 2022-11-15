require "faker"

puts "cleaning the DB of doppelgangers..."
Doppelganger.destroy_all
puts "DB is clean!"

puts "making 12 fake doppelgangers"

12.times do Doppelganger.create(
  name: Faker::FunnyName.two_word_name,
  age: rand(21..100),
  location: %w[Montreal Toronto Ottawa].sample,
  rate: rand(20..500),
  user: User.all.sample
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

puts "12 fake doppelgangers created."
# puts "20 fake bookings created."
