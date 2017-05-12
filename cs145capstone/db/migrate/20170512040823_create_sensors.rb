class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.integer :s1Flowrate
      t.integer :s2Flowrate

      t.timestamps
    end
  end
end
