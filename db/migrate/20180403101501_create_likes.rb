class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_like

      t.timestamps
    end
    add_index(:likes, [:user_id, :book_id], unique: true)
  end
end
