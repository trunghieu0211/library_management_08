require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context "associations" do
    it{is_expected.to belong_to :following}
    it{is_expected.to belong_to :follower_id}
  end
end
