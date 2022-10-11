# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def house_images
  @house_images ||= Dir.entries("#{Rails.root}/#{house_images_path}").reject { |f| f.start_with?(".") }
end

def house_images_path
  "app/assets/images/fake/houses"
end

def download_and_attach(attachment, file, path)
  file_path = "#{Rails.root}/#{path}/#{file}"
  attachment.attach(io: File.open(file_path), filename: file)
  attachment.save
end


100.times.each do |i|
  puts "creating listing #{i} of 100"
  listing = Listing.create(
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    bathrooms: rand(1..4),
    bedrooms: rand(1..6),
    sqft: rand(1200..4500),
    price: Faker::Commerce.price(range: 100000..300000.0, as_string: false),
    zipcode: Faker::Address.zip_code
  )
  download_and_attach(listing.photo, house_images.sample, house_images_path)
end

User.create(email: "test@test.com", name: "Test User")
