require 'rails_helper'

RSpec.describe Author, type: :model do
  context "associations" do
    it{is_expected.to have_many :authorBooks}
    it{is_expected.to have_many(:books).through(:authorBooks)}
    it{is_expected.to have_many(:relationships).dependent(:destroy)}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :name}
    it{is_expected.to validate_length_of(:name).is_at_most(Settings.author.author_max_size)}
    it{is_expected.to validate_presence_of :description}
    it{is_expected.to validate_length_of(:description).is_at_most(Settings.author.description_max_size)}
  end
end
