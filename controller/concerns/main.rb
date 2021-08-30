module Main

  def authentication
    content_type 'application/json'
    @user = User.find_by_authentication_token(params[:authentication_token])
    error 401  if @user.blank?
  end

end
