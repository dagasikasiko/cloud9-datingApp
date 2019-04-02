class DeffultKusokuso < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :image, :string, default: ""
  end
end
