Dir[File.join(__dir__, "/concerns/**/*.rb")].each { |file| require file }
require 'user'
require 'post'
require 'feedback'
require 'ip_address'
require 'rating'
require 'concerns/feedbackable'