require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new users page"
  end

  describe "POST #create" do

    context "with valid credentials" do
      it "saves the new user to the database"
      it "redirects to user's goals page"
    end

    context "with invalid credentials" do
      it "renders the new users template"
      it "displays errors on the sign up page"
    end
  end
end
