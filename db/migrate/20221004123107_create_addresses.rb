class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :addresses
      t.datetime :created_at,default: "now"
      t.datetime :updated_at,default: "now"

      t.timestamps
    end
  end
end
