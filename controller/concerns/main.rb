module Main

  def authentication
    content_type 'application/json'
    @user = User.where(:authentication_token => params[:key]).first
    error 401  if @user.blank?
  end

end
