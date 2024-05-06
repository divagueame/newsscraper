class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.integer :position, null: false
      t.integer :comments, null: false, default: 0
      t.integer :points, null: false, default: 0

      t.timestamps
    end
  end
end
