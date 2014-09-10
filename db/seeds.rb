require 'faker'



# Create a User
 # user = User.new(
 #   name:     'Valerie Mettler',
 #   email:    'valeriemettler@gmail.com',
 #   password: 'helloworld',
 # )
 # user.skip_confirmation!
 # user.save

# Create Users
# 5.times do
#   user = User.new(
#     name:     Faker::Name.name,
#     email:    Faker::Internet.email,
#     password: Faker::Lorem.characters(10)
#   )
#   user.skip_confirmation!
#   user.save!
# end
# users = User.all

# Create Bookmarks
# 10.times do
#   Bookmark.create!(
#     user:   users.sample,
#     url:    Faker::Lorem.string
#   )
# end
# bookmarks = Bookmarks.all

# Create Topics
# 10.times do
#   Topic.create!(
#     user:   users.sample,
#     name:  Faker::Lorem.sentence
#   )
# end
# topics = Topic.all

# Create a member
 # member = User.new(
 #   name:     'Member User',
 #   email:    'valeriemettler@gmail.com',
 #   password: 'helloworld',
 # )
 # member.skip_confirmation!
 # member.save

puts "Seed finished"
puts "#{User.count} users created"
# puts "#{Bookmark.count} todos created"
# puts "#{Topic.count} wikis created"

