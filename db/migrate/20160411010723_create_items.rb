class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :quantity
      t.string :unit
      t.decimal :price_per_unit
      t.decimal :min_quantity
      t.string :min_unit

      t.timestamps null: false
    end
  end
end
