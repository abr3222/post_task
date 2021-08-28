require 'sinatra'
%w[config models].each do |dir|
  $LOAD_PATH << File.expand_path('.', File.join(File.dirname(__FILE__), dir))
  require File.join(File.dirname(__FILE__), dir, 'manifest')
end

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