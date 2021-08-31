require './config/post_manager'
require 'faker'
require 'pry'

# Create First User for Api calls
User.create(name: Faker::Name.name, user_name:"ABR", password: "secure@password")

# TODO:DELTE THIS ONE
# require './app.rb'
# require './config/post_manager'


#Call sign in Api for generate token
response = PostManager.get_request("/auth/sign_in?user_name=ABR&password=secure@password")
puts authentication_token = response.nil? ? "ERROR: Make Sure Server is Running":  response["data"]["authentication_token"]

# Get all the Users
PostManager.get_request("/users",authentication_token)

# Created 50 IP addresses.
ip_addresses = []
50.times.each { ip_addresses << Faker::Internet.public_ip_v4_address }

# Create the posts

# 200k Posts, 2000 authers, each with atleast 100 posts.
# 2000.times.each do
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

# User.create(user_name: "Hafiz ABR")
# User.create(user_name: "Hafiz Hassan")
#
# IpAddress.create(ip:"192.168.1.1")
#
# Post.create(title:"First PoST" , content:"Yahoo" ,user_id: User.first.id,ip_address:IpAddress.first)
# Post.create(title:"Second PoST" , content:"Yahoo" ,user_id: User.last.id,ip_address:IpAddress.first)
#
#
#
# Feedback.create(feedbackable: User.first,comment:"Yes",owner_id: User.first.id)
# Feedback.create(feedbackable: Post.first,comment:"Yes",owner_id: User.first.id)
#
# Rating.create(value:3 , post_id: Post.first.id)
# Post.first.ratings.count
# Post.first.ratings.count
#
# #Count the feed back
#
# IpAddress.first.posts.count
#
# User.first.posts.count
# User.first.feedback.count
#
# Feedback.first.feedbackable.feedbacks.count #BY USER
# Feedback.last.feedbackable.feedbacks.count #BY Post



# base_uri = 'http://localhost:8080/api/v1'
# authentication_token = "?authentication_token=yD4WVgN7AM"
#
# response = HTTPX.get(base_uri + "/users"+authentication_token)
# puts response.body if response.status == 200

# Bundle i

# Rake DB:Seed
# Postman For Collection
# Read ME FILE
# rake db:drop db:create db:migrate db:seed

# run the server by
# ruby app.b

# for console access
# irb
# require './app.rb'


