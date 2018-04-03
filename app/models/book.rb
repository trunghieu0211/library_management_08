class Book < ApplicationRecord
  belongs_to :publisher
  has_many :categoryBooks
  has_many :authorBooks
  has_many :reviews
  has_many :likes
  has_many :rates
  has_many :requestBooks
  has_many :relationships, as: :following
end
