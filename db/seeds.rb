# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

User.destroy_all
Event.destroy_all

#créer 25 utilisateurs aléatoires
users = []
25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    email: email
  )
  users << user
end


# Create 6 events associated with random users
events = []
10.times do
  event = Event.create!(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    start_date: Faker::Date.forward(days: 30),
    duration: rand(30..240), # Assuming duration is in minutes
    price: rand(1..20)*5,
    location: Faker::Address.full_address,
    user_id: users.sample.id
  )
  events << event
end
