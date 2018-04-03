class CreateRequestBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :request_books do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :status
      t.datetime :date_begin
      t.datetime :date_end
      t.datetime :date_return

      t.timestamps
    end
  end
end
