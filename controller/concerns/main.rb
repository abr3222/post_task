module Main

  def authentication
    content_type 'application/json'
    error 401  unless params[:key] == "12345679"
  end

end
