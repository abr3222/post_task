module Posts
  module AllPostConcern

    def all_posts
      Post.all.map { |post| PostSerializer.new(post).to_json}.to_json
    end

  end
end