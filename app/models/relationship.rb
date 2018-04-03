class Relationship < ApplicationRecord
  belongs_to :following, polymorphic: true
end
