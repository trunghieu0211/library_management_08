class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.float :rate

      t.timestamps
    end
  end
end
