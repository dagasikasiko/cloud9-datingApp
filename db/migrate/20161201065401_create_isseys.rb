class CreateIsseys < ActiveRecord::Migration[5.0]
  def change
    create_table :isseys do |t|
      t.string :userid
      t.string :pass
      t.string :name
      t.string :grade
      t.integer :age
      t.string :profile
      t.integer :point

      t.timestamps
    end
  end
end
