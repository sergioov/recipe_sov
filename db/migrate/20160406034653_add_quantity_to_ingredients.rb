class AddQuantityToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :quantity, :decimal, precision: 9, scale: 2
    add_column :ingredients, :unit, :string
  end
end
