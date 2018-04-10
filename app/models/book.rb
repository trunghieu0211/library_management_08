class Book < ApplicationRecord
  paginates_per  1
  belongs_to :publisher
  has_many :categoryBooks
  has_many :category, through: :categoryBooks
  has_many :authorBooks
  has_many :author, through: :authorBooks
  has_many :reviews
  has_many :likes
  has_many :rates
  has_many :requestBooks
  has_many :relationships, as: :following

  scope :book_order, ->{order created_at: :desc}
  validates :name, presence: true, length:{maximum: Settings.book.book_length_max_size}
  validates :publisher, presence: true
  validates :description, presence: true, length:{maximum: Settings.book.description_max_length}
  validates :author, presence: true
  validates :category, presence: true
end
