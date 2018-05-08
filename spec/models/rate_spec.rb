require 'rails_helper'

RSpec.describe Rate, type: :model do
  context "associations" do
    it{is_expected.to belong_to(:rater).class_name("User")}
    it{is_expected.to belong_to :rateable}
  end
end
