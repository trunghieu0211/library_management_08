class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id
      t.string :following_type

      t.timestamps

      add_index :relationships, [:following_id, :follower_id], unique: true
    end
  end
end
