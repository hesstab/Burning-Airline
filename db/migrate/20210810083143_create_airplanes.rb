class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.text :name
      t.integer :capacity

      t.timestamps
    end
  end
end
