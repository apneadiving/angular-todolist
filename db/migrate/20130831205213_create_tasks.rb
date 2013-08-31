class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.text :description
      t.string :status
      t.integer :priority

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
