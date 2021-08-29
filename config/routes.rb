get '/' do
  'Welcome to Posting API APP!'
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

end