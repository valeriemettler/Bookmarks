require 'faker'



# Create a User
 # user = User.new(
 #   name:     'Valerie Mettler',
 #   email:    'valeriemettler@gmail.com',
 #   password: 'helloworld',
 # )
 # user.skip_confirmation!
 # user.save

#Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


#Create Bookmarks
10.times do
  Bookmark.create!(
    url:    Faker::Internet.url
  )
end
bookmarks = Bookmark.all

#Create Topics
10.times do
  Topic.create!(
    name:   Faker::Lorem.sentence
  )
end
topics = Topic.all

# take some(a sample) of the bookmark objects and assign them to some of your users
# user.bookmarks << bookmark
users.each do |user|
  3.times do
    user.bookmarks << Bookmark.all.sample
  end
end

# do the same thing for topics
 # same kind of thing
topics.each do |topic|
  3.times do
    user.topics << Topic.all.sample
 end
end

# Create a member
 member = User.new(
   name:     'Member User',
   email:    'valeriemettler@gmail.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"
puts "#{Topic.count} topics created"

