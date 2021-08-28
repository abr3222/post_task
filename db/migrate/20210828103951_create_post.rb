class CreatePost < ActiveRecord::Migration[6.1]
  def up
    create_table :posts do |t|
      t.string :name
    end
  end

  def down
    drop_table :posts
  end
end
