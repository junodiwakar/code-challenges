class AddIndexToUsersJti < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :jti, unique: true
  end
end
