require 'rails_helper'

RSpec.describe CategoryBook, type: :model do
  context "associations" do
    it{is_expected.to belong_to :book}
    it{is_expected.to belong_to :category}
  end
end
