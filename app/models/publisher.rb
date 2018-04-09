class Publisher < ApplicationRecord
  has_many :books

  scope :publisher_order, ->{order created_at: :desc}

  validates :name, presence: true, uniqueness: true, length:{maximum: Settings.publisher.publisher_max_size}

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
