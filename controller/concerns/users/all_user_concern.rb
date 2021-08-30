module Users
  module AllUserConcern

    def all_users
      User.all.map { |user| UserSerializer.new(user).to_json}.to_json
    end

    def sign_in
      check_user = User.where(:user_name => params[:user_name] , :encrypted_password => params[:password])
      unless check_user.nil?
        o = [('a'..'z'), ('A'..'Z') , (0..9)].map(&:to_a).flatten
        check_user.update(:authentication_token => (0...10).map { o[rand(o.length)] }.join)
        {status: 200 , data: check_user}.to_json
      else
        {status: 402 , msg: "Invalid Username or Password"}.to_json
      end

    end

  end
end