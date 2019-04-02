class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_flg, :boolean, default: 0
  end
end
