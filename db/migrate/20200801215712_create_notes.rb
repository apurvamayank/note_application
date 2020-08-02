class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.timestamps
      t.string :title, limit: 30, null: false
      t.string :body, limit: 1000
      t.integer :user_id
    end
  end
end
