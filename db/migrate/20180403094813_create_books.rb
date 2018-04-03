class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :publisher, foreign_key: true
      t.string :name
      t.integer :status
      t.string :description
      t.string :image_url
      t.integer :number_page

      t.timestamps
    end
  end
end
