class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :subject
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
