require './config/post_manager'
require 'faker'
require 'pry'

# Create First User for Api calls
User.create(name: Faker::Name.name, user_name:"ABR", password: "secure@password")

#Call sign in Api for generate token
response = PostManager.get_request("/auth/sign_in?user_name=ABR&password=secure@password")
puts authentication_token = response.nil? ? "ERROR: Make Sure Server is Running":  response["data"]["authentication_token"]

# Get all the Users
PostManager.get_request("/users",authentication_token)

# Created 50 IP addresses.
ip_addresses = []
50.times.each { ip_addresses << Faker::Internet.public_ip_v4_address }

# Create the posts
# 200k Posts, 2000 author, each with at least 100 posts.
i = 0
post_count = 2000
post_count.times.each do
  username = Faker::Internet.unique.username(specifier: 3..25)
  100.times.each do
    body = {
      "title":"Test Post 2 Title",
      "content":"Test Post 2 content",
      "ip_address": ip_addresses.sample,
      "author_name": username
    }
    PostManager.post_request("/posts",authentication_token,body)
    i = i+1
    puts "#{i}/ #{post_count*100} Post Has been Created"
  end
end

i = 0
User.first(100).each do |user|
  Post.first(100).each do |post|

    user_or_post = ["user","post"]

    feedbackable_type = user_or_post.sample
    params = {
      "comment": Faker::Lorem.sentence,
      "owner_id":1,
      "feedbackable_type": feedbackable_type ,
      "feedbackable_id": feedbackable_type == "user"?  user.id : post.id
    }

    PostManager.post_request("/feedback",authentication_token,params)
    i = i+1
    puts "#{i}/ #{10000} Feed Back Has been Created"
  end
end