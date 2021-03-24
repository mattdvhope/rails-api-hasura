class ChangeUserFields < ActiveRecord::Migration[6.1]
  def change
  	remove_column :users, :email
  	remove_column :users, :username
  	add_column :users, :fb_id, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :name, :string
  	add_column :users, :picture_url, :string
  end
end
