class FeedbackSerializer
  def initialize(feedback)
    @feedback = feedback
  end

  def to_json(*)
    data = {
      resource_id: @feedback.feedbackable_id,
      resource_type: @feedback.feedbackable_type,
      comment: @feedback.comment
    }
    data[:errors] = @feedback.errors if @feedback.errors.any?
    data
  end
end
