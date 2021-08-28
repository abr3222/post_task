include   Users::AllUserConcern
namespace '/api/v1' do
  before do
    content_type 'application/json'
    error 401  unless params[:key] == "12345679"
  end

  get '/users' do
    all_users
  end
end