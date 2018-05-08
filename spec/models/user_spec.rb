require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it{is_expected.to have_many :reviews}
    it{is_expected.to have_many :likes}
    it{is_expected.to have_many :requestBooks}
    it{is_expected.to have_many :active_relationships}
    it{is_expected.to have_many :passive_relationships}
    it{is_expected.to have_many :following}
    it{is_expected.to have_many :followers}
    it{is_expected.to have_many :relationships}
  end

  context "validations" do
    it{is_expected.to validate_length_of(:name).is_at_most Settings.user.name_max_size}
    it{is_expected.to validate_length_of(:phone).is_at_most Settings.user.phone_max_size}
  end
end
