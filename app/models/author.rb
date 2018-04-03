class Author < ApplicationRecord
  has_many :authorBooks
  has_many :relationships, as: :following
end
