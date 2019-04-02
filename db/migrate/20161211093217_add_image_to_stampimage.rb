class AddImageToStampimage < ActiveRecord::Migration[5.0]
  def change
    add_column :stampimages, :image, :string
  end
end
