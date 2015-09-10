require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid" do
    expect(build :user).to be_valid
  end

  it "is invalid witn a duplicate email" do
    temi = build(:user, name: "Temi Olaolu", email: "daisi.sowemimo@yahoo.com")
    # expect(temi).to have(1).errors_on(:email)
  end
end
