class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :review_order, ->{order created_at: :desc}

  validates :content, presence: true,
    length: {maximum: Settings.review.description_max_size}
end
