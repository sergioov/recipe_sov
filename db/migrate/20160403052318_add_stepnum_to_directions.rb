class AddStepnumToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :StepNum, :integer
  end
end
