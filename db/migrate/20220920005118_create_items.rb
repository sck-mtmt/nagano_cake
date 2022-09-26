class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.text :instroduction
      t.integer :price
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end
  end
end
