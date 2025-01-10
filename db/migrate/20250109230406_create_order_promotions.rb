class CreateOrderPromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :order_promotions do |t|
      t.references :order, foreign_key: true
      t.references :promotion, foreign_key: true
      t.decimal :discount_applied, precision: 10, scale: 2

      t.timestamps
    end
  end
end
