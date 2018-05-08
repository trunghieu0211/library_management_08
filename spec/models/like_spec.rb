require 'rails_helper'

RSpec.describe Like, type: :model do
  context "associations" do
    it{is_expected.to belong_to :book}
    it{is_expected.to belong_to :user}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :user}
    it{is_expected.to validate_presence_of :book}
  end
end
