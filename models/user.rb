class User < ActiveRecord::Base
  include FeedBackAble

  has_many :posts
  has_many :feedbacks, as: :feedbackable, dependent: :destroy
  has_many :created_feedbacks, :class_name => 'Feedback', :foreign_key => 'owner_id'

end