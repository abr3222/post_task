class Post < ActiveRecord::Base
  include FeedBackAble

  belongs_to :ip_address

  has_many :ratings

  has_many :feedbacks, as: :feedbackable

  belongs_to :user
end