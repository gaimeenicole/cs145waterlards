class AddFloatRatestoSensors < ActiveRecord::Migration[5.0]
  def change
      add_column :sensors, :s1fr, :float
      add_column :sensors, :s2fr, :float
  end
end
