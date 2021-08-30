class PostSerializer
  def initialize(post)
    @post = post
  end

  def to_json(*)
    data = {
      id: @post.id,
      title: @post.title,
      content: @post.content
    }
    data[:errors] = @post.errors if @post.errors.any?
    data
  end
end
