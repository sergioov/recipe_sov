class AddUnitTypeToItem < ActiveRecord::Migration
  def change
  	add_column :items, :unit_type, :string
  end
end
