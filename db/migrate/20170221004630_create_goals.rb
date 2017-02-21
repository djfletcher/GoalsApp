class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.boolean :visible, null: false
      t.boolean :finished, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
