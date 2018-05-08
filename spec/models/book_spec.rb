require 'rails_helper'

RSpec.describe Book, type: :model do
  context "associations" do
    it{is_expected.to belong_to :publisher}
    it{is_expected.to have_many(:categoryBooks).dependent(:destroy)}
    it{is_expected.to have_many(:categories).through(:categoryBooks)}
    it{is_expected.to have_many(:authorBooks).dependent(:destroy)}
    it{is_expected.to have_many(:authors).through(:authorBooks)}
    it{is_expected.to have_many(:reviews).dependent(:destroy)}
    it{is_expected.to have_many(:likes).dependent(:destroy)}
    it{is_expected.to have_many(:requestBooks).dependent(:destroy)}
    it{is_expected.to have_many(:relationships).dependent(:destroy)}
  end

  context "validates" do
    it{is_expected.to validate_presence_of :name}
    it{is_expected.to validate_length_of(:name).is_at_most(Settings.book.book_length_max_size)}
    it{is_expected.to validate_presence_of :publisher}
    it{is_expected.to validate_presence_of :description}
    it{is_expected.to validate_length_of(:description).is_at_most(Settings.book.description_max_length)}
  end
end
