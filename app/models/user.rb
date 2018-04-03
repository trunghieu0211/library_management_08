class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :likes
  has_many :rates
  has_many :requestBooks
  has_many :relationships, as: :following
end
