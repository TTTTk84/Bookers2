# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# 3.times do |i|
#   User.create(name: "test user#{i + 1}", email: "test#{i + 1}@example.com", password: "tttttt")
# end

# 15.times do |i|
#   Book.create(title: "book#{i+1}", body: "test", user_id: rand(1..3))
# end

# フォロー機能
users = User.all
user = users.first

# testuser1 が testuser3 を フォロー(active)
# testuser1 が testuser2 と testuser3 に フォローされている(passive)
following = users[2]
followers = users[1, 2]

user.follow(following)
followers.each { |follower| follower.follow(user) }
