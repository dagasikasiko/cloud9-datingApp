class AddUseridsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :userid, :integer
    add_column :messages, :user_id, :integer
  end
end
