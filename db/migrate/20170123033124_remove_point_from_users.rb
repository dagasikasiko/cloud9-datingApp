class RemovePointFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :point, :integer
  end
end
