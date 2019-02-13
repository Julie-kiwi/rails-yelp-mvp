# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts 'I destroy all restaurants'
Restaurant.destroy_all

puts 'I create 5 new restaurants'
5.times do
  Restaurant.create(
    name: Faker::Company.name,
    address: Faker::Friends.location,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )
end
puts 'Finished !'
