class CreateUserpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :userpoints do |t|
      t.references :user
      t.integer :point, default:300

      t.timestamps
    end
    add_index :userpoints, [:user_id, :created_at]
  end
end
