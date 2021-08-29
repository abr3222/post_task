class Feedback < ActiveRecord::Base
  belongs_to :feedbackable, :polymorphic => true

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

  # #Count the feed back
  #
  # IpAddress.first.posts.count
  #
  # User.first.posts.count
  # User.first.feedback.count
  #
  # Feedback.first.feedbackable.feedbacks.count #BY USER
  # Feedback.last.feedbackable.feedbacks.count #BY Post
end