require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is a valid full link address" do
    expect(build(:link)).to be_valid
  end

  it "was created by a reistered user" do
    # expect(build(:link).user).to eq(:user)
  end

  it "was created by non registered user" do
    expect(build(:link, user: nil).user).to eq(nil)
  end

end
