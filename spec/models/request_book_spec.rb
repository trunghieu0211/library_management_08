require 'rails_helper'

RSpec.describe RequestBook, type: :model do
  context "associations" do
    it{is_expected.to belong_to :user}
    it{is_expected.to belong_to :book}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :user}
    it{is_expected.to validate_presence_of :book}
    it{is_expected.to validate_presence_of :status}
  end
end
