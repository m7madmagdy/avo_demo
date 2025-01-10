class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.boolean :advertised, default: true
      t.boolean :active, default: true
      t.datetime :starts_at
      t.datetime :expires_at
      t.integer :usage_limits
      t.text :description
      t.string :title

      t.timestamps
    end

    add_index :promotions, :code, unique: true
    add_index :promotions, :starts_at
    add_index :promotions, :expires_at
    add_index :promotions, :created_at
    add_index :promotions, :updated_at
  end
end
