module FeedBackAble
  extend ActiveSupport::Concern

  included do
    has_many :feedback, :as => :feedbackable
  end
end