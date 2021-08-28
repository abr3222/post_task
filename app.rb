require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/namespace"
require './models/user'
require './models/post'

set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  'Welcome to Posting API APP!'
end

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/users' do
    User.all.to_json
  end
  get '/posts' do
    Post.all.to_json
  end
end