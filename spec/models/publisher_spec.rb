require 'rails_helper'

RSpec.describe Publisher, type: :model do
  context "associations" do
    it{is_expected.to have_many(:books).dependent(:destroy)}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :name}
    it{is_expected.to validate_uniqueness_of :name}
    it{is_expected.to validate_length_of(:name).is_at_most(Settings.publisher.publisher_max_size)}
  end
end
