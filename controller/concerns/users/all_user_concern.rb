module Users
  module AllUserConcern

    def all_users
      User.all.to_json
    end

  end
end