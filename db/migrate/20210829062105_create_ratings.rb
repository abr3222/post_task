class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :value ,:default => 1, :null => false
      t.references :post, :null => false,index:true
    end

  end
end
