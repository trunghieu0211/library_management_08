class AddDescriptionToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :description, :string
  end
end
