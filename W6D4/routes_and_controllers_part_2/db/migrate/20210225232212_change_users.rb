class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    #add_column :users, :username, :string, null:false
    rename_column :users, :name, :username
    remove_column :users, :email
#    add_index :users, :username, unique:true
  end
end
