class CreateUserimages < ActiveRecord::Migration[5.0]
  def change
    create_table :userimages do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
