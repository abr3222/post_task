class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name, unique: true, :null => false
      t.string :password_digest
      t.string :authentication_token
    end
  end
end
