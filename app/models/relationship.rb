class Relationship < ApplicationRecord
  belongs_to :following, polymorphic: true
  belongs_to :follower_id
end
