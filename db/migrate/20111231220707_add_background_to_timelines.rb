class AddBackgroundToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :background, :string
  end
end
