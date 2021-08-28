Dir[File.join(__dir__, "/concerns/**/*.rb")].each { |file| require file }
require 'users'
require 'posts'