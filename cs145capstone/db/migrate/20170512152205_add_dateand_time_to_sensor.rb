class AddDateandTimeToSensor < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :dateUploaded, :date
    add_column :sensors, :timeUploaded, :time
  end
end
