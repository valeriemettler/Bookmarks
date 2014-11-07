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

# Create a member
 member = User.new(
   name:     'Member User',
   email:    'valeriemettler@gmail.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save
users = User.all

#Create Bookmarks
10.times do
  url = Faker::Internet.url
  if Bookmark.where(url: url).empty?
    Bookmark.create!(
      url:    Faker::Internet.url
    )
  end
end
bookmarks = Bookmark.all

#Create Topics
10.times do
  name = Faker::Lorem.word
  if Topic.where(name: name).empty?
  Topic.create!(
    name:   Faker::Lorem.word
  )
 end
end
topics = Topic.all

# take some(a sample) of the bookmark objects and assign them to some of your users
# user.bookmarks << bookmark
users.each do |user|
  3.times do
    user.bookmarks << Bookmark.all.sample
  end
end

bookmarks.each do |bookmark|
topic = Topic.all.sample
bookmark.topics << topic
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"
puts "#{Topic.count} topics created"