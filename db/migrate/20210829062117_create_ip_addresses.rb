class CreateIpAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :ip_addresses do |t|
      t.string :ip , :null => false , :default=> '0.0.0.0'
      # t.references :post, :null => false
    end
  end
end
