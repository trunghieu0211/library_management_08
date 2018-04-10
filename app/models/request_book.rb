class RequestBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :request_order, ->{order created_at: :desc}

  enum status: [:pending, :accept, :reject]

  validates :user, :book, presence: true
  validates :status, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
