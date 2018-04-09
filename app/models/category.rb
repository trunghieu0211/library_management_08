class Category < ApplicationRecord
  has_many :categoryBooks

  scope :category_order, ->{order created_at: :desc}

  validates :name, presence: true, length:{maximum: Settings.category.category_max_size}

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
