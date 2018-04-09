class Category < ApplicationRecord
  has_many :categoryBooks

  validates :name, presence: true, length:{maximum: Settings.category.category_max_size}
end
