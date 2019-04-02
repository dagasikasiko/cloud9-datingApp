class AddImageToUserimage < ActiveRecord::Migration[5.0]
  def change
    add_column :userimages, :image, :string
  end
end
