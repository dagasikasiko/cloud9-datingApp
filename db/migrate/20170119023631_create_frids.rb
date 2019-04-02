class CreateFrids < ActiveRecord::Migration[5.0]
  def change
    create_table :frids, id: false do |t|
      t.integer :userid
      t.integer :friendid

      t.timestamps
    end
    add_index :frids, [ :userid, :friendid ], unique: true
  end
end
