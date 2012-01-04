class AddTimelineIdToRecords < ActiveRecord::Migration
  def change
    add_column :records, :timeline_id, :integer
    add_index :records, :timeline_id
  end
end
