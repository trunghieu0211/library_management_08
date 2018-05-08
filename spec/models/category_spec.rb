require 'rails_helper'

RSpec.describe Category, type: :model do
  context "associations" do
    it{is_expected.to have_many :categoryBooks}
    it{is_expected.to have_many(:books).through(:categoryBooks)}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :name}
    it{is_expected.to validate_uniqueness_of :name}
    it{is_expected.to validate_length_of(:name).is_at_most(Settings.category.category_max_size)}
  end
end
