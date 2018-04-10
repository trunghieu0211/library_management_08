class Book < ApplicationRecord
  belongs_to :publisher
  has_many :categoryBooks
  has_many :categories, through: :categoryBooks
  has_many :authorBooks
  has_many :authors, through: :authorBooks
  has_many :reviews
  has_many :likes
  has_many :rates
  has_many :requestBooks
  has_many :relationships, as: :following

  mount_uploader :image_url, ImageUploader

  scope :book_order, ->{order created_at: :desc}
  validates :name, presence: true, length:{maximum: Settings.book.book_length_max_size}
  validates :publisher, presence: true
  validates :description, presence: true, length:{maximum: Settings.book.description_max_length}

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
