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
      elsif (1..5).include? input_params["ratings"].to_i
        Rating.create(value:input_params["ratings"] , post_id: input_params["post_id"])
        total_ratings = Rating.where(post_id: input_params["post_id"])
        new_ratings = 0
        total_ratings.each do |rating|
          new_ratings = new_ratings + rating.value
        end
        new_ratings = ( new_ratings / (total_ratings.count) )
        post.update(total_ratings: total_ratings.count , average_rating: new_ratings)
        {status: 200 , new_ratings:new_ratings }.to_json
      else
        {status: 404 , error: "Ratting only could be between 1..5" }.to_json
      end

    end

    def create_feedback
      input_params    = JSON.parse(request.body.read)
      comment         = input_params["comment"]
      owner_id        = input_params["owner_id"]
      feedback_type   = input_params["feedbackable_type"]
      feedbackable_id = input_params["feedbackable_id"].to_i
      if feedback_type == "user" or feedback_type == "User"
        feedbackable = User.find_by_id(feedbackable_id)
      else
        feedbackable = Post.find_by_id(feedbackable_id)
      end

      if feedbackable.blank? or feedbackable.nil?
        {status: 402 , error: "Invalid #{feedback_type} ID"}.to_json
      else
        feedback = Feedback.create(feedbackable: feedbackable,comment:comment,owner_id: owner_id)
        {status: 200 , data: feedback}.to_json
      end
    end

    def get_posts_by_rating
      Post.all.order('average_rating desc').limit(params[:number_of_posts]).map { |post| PostSerializer.new(post).to_json}.to_json
    end

    def get_authors_from_ip
      IpAddress.all.map{|ip|
        { ip_address: ip.ip,
          authors: ip.posts.map{|post| 
          {author_name: post.user.user_name} 
        }
      }
      }.to_json
    end

  end
end