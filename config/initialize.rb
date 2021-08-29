require 'sinatra/activerecord'
require "sinatra/namespace" #Comment this Before Running rake task as Both define same namespace function
require "awesome_print"
set :bind, '0.0.0.0'
set :port, 8081

