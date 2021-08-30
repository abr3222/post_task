get '/' do
  'Welcome to Posting API APP!'
end

namespace '/api/users' do
  before do
    content_type 'application/json'
  end

  get '/sign_in' do
    sign_in
  end
end
namespace '/api/v1' do

  before do
    authentication
  end

  get '/users' do
    all_users
  end

  get '/posts' do
    all_posts
  end

  post '/posts' do
    create_post
  end

  post '/rate_post' do
    rate_post
  end

end