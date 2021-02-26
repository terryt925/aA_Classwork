class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
    add_column :users, :email, :string, null: false, unique: true
  end
end
