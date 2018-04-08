class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  scope :user_order, ->{order created_at: :desc}

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :requestBooks, dependent: :destroy
  has_many :relationships, as: :following, dependent: :destroy

  validates :name, length: {maximum: Settings.user.name_max_size}
  validates :phone, length: {maximum: Settings.user.phone_max_size}

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
