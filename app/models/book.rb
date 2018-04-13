class Book < ApplicationRecord
  belongs_to :publisher
  has_many :categoryBooks, dependent: :destroy
  has_many :categories, through: :categoryBooks
  has_many :authorBooks, dependent: :destroy
  has_many :authors, through: :authorBooks
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :requestBooks, dependent: :destroy
  has_many :relationships, as: :following, dependent: :destroy

  ratyrate_rateable "attitude"

  mount_uploader :image_url, ImageUploader
  enum status: [:available, :rented]

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
