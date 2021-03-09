class ChangeNameToUserName < ActiveRecord::Migration[6.1]
  def change
  	remove_column :users, :name
  	add_column :users, :username, :string
  end
end
