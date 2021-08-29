class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :feedbackable, polymorphic: true, index: true
      t.string :comment
      t.references :owner, foreign_key: {to_table: :users}, :null => false
    end
  end

end
