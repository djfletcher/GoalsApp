require 'spec_helper'
require 'rails_helper'


feature "the signup process" do
  sparky = FactoryGirl.build(:user)

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up(sparky)
      expect(page).to have_content(sparky.username)
    end

  end

end

feature "logging in" do
  sparky = FactoryGirl.create(:user)

  scenario "shows username on the homepage after login" do
    sign_in(sparky)
    expect(page).to have_content(sparky.username)
  end

end

feature "logging out" do
  sparky = FactoryGirl.create(:user)

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to have_content("Sign In")
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_in(sparky)
    click_on "Log Out"
    expect(page).not_to have_content(sparky.username)
  end

end
