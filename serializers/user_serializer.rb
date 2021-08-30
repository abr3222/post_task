class UserSerializer
  def initialize(user)
    @user = user
  end

  def to_json(*)
    data = {
      id: @user.id,
      username: @user.user_name
    }
    data[:errors] = @user.errors if @user.errors.any?
    data
  end
end
