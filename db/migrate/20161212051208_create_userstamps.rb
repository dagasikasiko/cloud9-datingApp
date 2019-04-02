class CreateUserstamps < ActiveRecord::Migration[5.0]
  def change
    create_table :userstamps do |t|
      t.integer :user_id
      t.integer :stamp_id

      t.timestamps
    end
  end
end
