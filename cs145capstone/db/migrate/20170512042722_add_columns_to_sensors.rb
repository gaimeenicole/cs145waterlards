class AddColumnsToSensors < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :sequenceNo, :integer
    add_column :sensors, :locationNo, :integer
  end
end
