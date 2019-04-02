class AddPointUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :point, :integer, default: 300
  end
end
