module Users
  module AllUserConcern

    def all_users
      User.all.map { |user| UserSerializer.new(user).to_json}.to_json
    end

    def sign_in
      user = User.find_by_user_name(params[:user_name])
      check_user = user.authenticate(params[:password])

      if check_user
        o = [('a'..'z'), ('A'..'Z') , (0..9)].map(&:to_a).flatten
        check_user.update(:authentication_token => (0...10).map { o[rand(o.length)] }.join)
        {status: 200 , data: check_user}.to_json
      else
        {status: 402 , msg: "Invalid Username or Password"}.to_json
      end

    end

  end
end