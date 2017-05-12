class AddColumns2ToSensors < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :s1ML, :integer
    add_column :sensors, :s2ML, :integer
  end
end
