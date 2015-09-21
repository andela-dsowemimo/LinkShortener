require "rails_helper"

feature "User Management" do
  before :each do
    @registered_user = create(:user)
  end

  scenario "visit log in" do
    visit root_path
    click_link "Sign In"
    expect(current_path).to eq(login_path)
  end

  scenario "log in" do
    visit login_path
    fill_in "session_email", with: @registered_user.email
    fill_in "session_password", with: @registered_user.password
    click_button "Login"
    expect(current_path).to eq(user_path(@registered_user))
    expect(page).to have_content("You have shortened 0 links")
  end

end
