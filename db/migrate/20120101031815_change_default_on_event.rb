class ChangeDefaultOnEvent < ActiveRecord::Migration
  def up
    change_column :events, :video, :string, :default => "edit here"
    change_column :events, :description, :text, :default => "edit here"
  end

  def down
  end
end
