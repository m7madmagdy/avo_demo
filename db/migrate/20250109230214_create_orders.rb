class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string  :number, null: false
      t.decimal :total, precision: 10, scale: 2
      t.decimal :total_after_discounts, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :orders, :created_at
    add_index :orders, :updated_at
  end
end
