class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :description,  null: false 
      t.integer :user_id, null: false 
      t.string :privacy_status, null: false 
      t.string :goal_status, null: false 

      t.timestamps
    end
    add_index :goals, :user_id 
  end
end
