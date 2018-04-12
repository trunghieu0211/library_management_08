class Like < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user, :book, presence: true
end
