require "faker"

puts "cleaning the DB of doppelgangers..."
Doppelganger.destroy_all
puts "DB is clean!"

puts "making 24 fake doppelgangers..."

def build_address
  num = rand(10..100)
  street = %w[Papineau Laurier Victoria King Queen].sample
  city = %w[Montreal Toronto Ottawa].sample
  return num.to_s + " " + street + ", " + city
end

24.times do Doppelganger.create(
  name: Faker::FunnyName.two_word_name,
  age: rand(21..100),
  gender: rand(1..3),
  address: build_address,
  rate: rand(20..500),
  bio: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
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

puts "24 fake doppelgangers created, **not all with valid geocodes -- approx. 83% success rate.**"
# puts "20 fake bookings created."
