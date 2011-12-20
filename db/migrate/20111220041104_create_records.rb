class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
    add_index :records, :event_id
    add_index :records, :user_id
  end
end
