require 'rails_helper'

RSpec.describe OverallAverage, type: :model do
  context "associations" do
    it{is_expected.to belong_to(:rateable)}
  end
end
