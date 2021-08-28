namespace '/api/v1' do
  before do
    content_type 'application/json'
  end


  get '/posts' do
    Post.all.to_json
  end
end