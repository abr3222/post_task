namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/users' do
    User.all.to_json
  end
end