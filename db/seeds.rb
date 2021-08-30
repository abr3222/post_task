# Faker::Name.name


User.create(name: "Hafiz ABR", user_name:"ABR", password: "secure@password")

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


# Created 50 IP addresses.
# ip_addresses = []
# 50.times.each { ip_addresses << Faker::Internet.public_ip_v4_address }

base_uri = 'http://localhost:8080/api/v1'
authentication_token = "?authentication_token=yD4WVgN7AM"

response = HTTPX.get(base_uri + "/users"+authentication_token)
puts response.body if response.status == 200

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

