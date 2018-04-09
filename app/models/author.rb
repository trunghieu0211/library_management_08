class Author < ApplicationRecord
  has_many :authorBooks
  has_many :relationships, as: :following

  scope :author_order, ->{order created_at: :desc}

  validates :name, presence: true, length:{maximum: Settings.author.author_max_size}

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
