class AddDeltaToSensor < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :delta, :integer
  end
end
