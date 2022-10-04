class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :total_paymont
      t.integer :payment_method,default: 0, null: false, limit: 1
      t.integer :status,default: 0, null: false, limit: 1
      t.datetime :create_at
      t.datetime :update_at


      t.timestamps
    end
  end
end
