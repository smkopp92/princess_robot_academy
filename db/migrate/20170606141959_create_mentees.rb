class CreateMentees < ActiveRecord::Migration[5.0]
  def change
    create_table :mentees do |t|
      t.string :name, null: false
      t.integer :princess_robot_id, null: false
    end
  end
end
