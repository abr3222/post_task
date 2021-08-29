class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title , null: false
      t.string :content , null: false
      t.integer :total_ratings ,:default => 0, :null =>  false
      t.float :average_rating, :default => 0.0, :null => false
      t.references :user, null: false
      t.references :ip_address, null: false
    end
  end
end
