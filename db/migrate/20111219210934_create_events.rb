class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :timeline_id
      t.datetime :time
      t.string :video
      t.text :description

      t.timestamps
    end
    add_index :events, :timeline_id
  end
end
