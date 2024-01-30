class AddUsersTable < ActiveRecord::Migration[7.1]
  def change
    create_table :users
  end
end
