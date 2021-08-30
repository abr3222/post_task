require 'sinatra/base'

# get '/' do
#   'Welcome to Posting API APP!'
# end

# define route that don't need auth in here
class OpenAPI < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/auth/sign_in' do
    sign_in
  end
end

class AuthedAPI < Sinatra::Base
  before do
    authentication
  end

  set :prefix,"/api/v1"

  get "#{settings.prefix}/users" do
    all_users
  end

  get "#{settings.prefix}/posts" do
      all_posts
  end

  post "#{settings.prefix}/posts" do
      create_post
  end

  post "#{settings.prefix}/rate_post" do
      rate_post
  end

end
