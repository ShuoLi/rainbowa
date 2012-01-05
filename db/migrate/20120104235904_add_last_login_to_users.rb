class AddLastLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_login, :date, :default => Time.now-1.day
  end
end
