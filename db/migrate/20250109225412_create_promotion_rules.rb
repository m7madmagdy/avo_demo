class CreatePromotionRules < ActiveRecord::Migration[8.0]
  def change
    create_table :promotion_rules do |t|
      t.references :promotion, foreign_key: true, null: false
      t.string :type, null: false
      t.jsonb :preferences, default: {}

      t.timestamps
    end
  end
end
