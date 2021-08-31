module Posts
  module AllPostConcern

    def all_posts
      Post.all.map { |post| PostSerializer.new(post).to_json}.to_json
    end

    def create_post
      input_params = JSON.parse(request.body.read)
      author = User.find_by_user_name(input_params["author_name"])
      author = User.create(user_name: input_params["author_name"],password:"One@FourAll") if author.nil?
      ip_address = IpAddress.find_or_create_by(ip:input_params["ip_address"])
      post = Post.create(title:input_params["title"] , content:input_params["content"] ,user:author,ip_address:ip_address)
      {status: 200 , data: post}.to_json
    end

    def rate_post
      input_params = JSON.parse(request.body.read)
      post = Post.find_by_id(input_params["post_id"])

      if post.nil?
        {status: 404 , error: "Post Not Found to create Ratting" }.to_json
      else
        Rating.create(value:input_params["ratings"] , post_id: input_params["post_id"])
        total_ratings = Rating.where(post_id: input_params["post_id"])
        new_ratings = 0
        total_ratings.each do |rating|
          new_ratings = new_ratings + rating.value
        end
        new_ratings = ( new_ratings / (total_ratings.count) )
        post.update(total_ratings: new_ratings)
        {status: 200 , new_ratings:new_ratings }.to_json
      end

    end

  end
end