class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enum permision: [:user, :admin, :manager]
  ratyrate_rater

  scope :user_order, ->{order created_at: :desc}

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :requestBooks, dependent: :destroy
  has_many :active_relationships, class_name: RelationshipUser.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: RelationshipUser.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy

  validates :name, length: {maximum: Settings.user.name_max_size}
  validates :phone, length: {maximum: Settings.user.phone_max_size}

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
