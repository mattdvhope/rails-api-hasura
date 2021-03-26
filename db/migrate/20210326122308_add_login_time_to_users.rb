class AddLoginTimeToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_column :users, :login_time, :integer
  end
end
