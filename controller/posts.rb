include   Posts::AllPostConcern
namespace '/api/v1' do
  before do
    content_type 'application/json'
  end


  get '/posts' do
    all_posts
  end
end