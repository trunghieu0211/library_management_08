require 'rails_helper'

RSpec.describe Review, type: :model do
  context "associations" do
    it{is_expected.to belong_to :user}
    it{is_expected.to belong_to :book}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :content}
    it{is_expected.to validate_length_of(:content).is_at_most Settings.review.description_max_size}
  end
end
