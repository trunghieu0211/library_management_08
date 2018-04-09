class Author < ApplicationRecord
  has_many :authorBooks
  has_many :relationships, as: :following

  scope :author_order, ->{order created_at: :desc}

  validates :name, presence: true, length:{maximum: Settings.author.author_max_size}
end
