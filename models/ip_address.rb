class IpAddress < ActiveRecord::Base

  has_many :posts

  validates :ip, uniqueness: true
end