class CreatePrincessRobots < ActiveRecord::Migration[5.0]
  def change
    create_table :princess_robots do |t|
      t.string :name, null: false
      t.string :purpose, null: false
      t.string :favorite_romantic_comedy
      t.integer :power_level
    end
  end
end
