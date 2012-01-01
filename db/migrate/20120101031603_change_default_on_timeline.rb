class ChangeDefaultOnTimeline < ActiveRecord::Migration
  def up
    change_column :timelines, :description, :text, :default => "edit here"
    change_column :timelines, :photo, :string, :default => "edit here"
    change_column :timelines, :background, :background, :default => "edit here"    
  end

  def down
  end
end
