class AddLastEditToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :last_edit, :date, :default => Time.now
  end
end
