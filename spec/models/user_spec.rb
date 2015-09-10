require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid" do
    expect(build :user).to be_valid
  end

  it "is invalid without a name"  do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid witn a duplicate email" do
    create(:user)
    temi = build(:user, name: "Temi Olaolu", email: "daisi.sowemimo@yahoo.com")
    expect(temi).to have(1).errors_on(:email)
  end
end
