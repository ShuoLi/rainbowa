class AddFollowCountOnTimelines < ActiveRecord::Migration
  def up
    add_column :timelines, :follow_count, :integer, :default => 0
  end

  def down
  end
end
