class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :timeline_id

      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :timeline_id 
  end
end
