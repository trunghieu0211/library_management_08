require 'rails_helper'

RSpec.describe RelationshipUser, type: :model do
  context "associations" do
    it{is_expected.to belong_to(:follower).class_name("User")}
    it{is_expected.to belong_to(:followed).class_name("User")}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :follower}
    it{is_expected.to validate_presence_of :followed}
  end
end
