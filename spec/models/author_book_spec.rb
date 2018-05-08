require 'rails_helper'

RSpec.describe AuthorBook, type: :model do
  context "associations" do
    it{is_expected.to belong_to :author}
    it{is_expected.to belong_to :book}
  end
end
