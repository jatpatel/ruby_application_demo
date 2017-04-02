require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:category)).to be_valid
  end

end
