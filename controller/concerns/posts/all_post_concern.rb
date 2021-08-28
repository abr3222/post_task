module Posts
  module AllPostConcern

    def all_posts
      Post.all.to_json
    end

  end
end