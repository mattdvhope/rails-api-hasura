class LoginTimeToDt < ActiveRecord::Migration[6.1]
  def change
  	remove_column :users, :login_time
  	add_column :users, :login_time, :datetime
  end
end
