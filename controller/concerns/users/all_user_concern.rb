module Users
  module AllUserConcern

    def all_users
      User.all.map { |user| UserSerializer.new(user).to_json}.to_json
    end

  end
end