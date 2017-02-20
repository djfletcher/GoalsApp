require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new users page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do

    context "with valid credentials" do
      it "redirects to user's goals page" do
        post :create, user: { username: "sally", password: "test123" }
        expect(response).to redirect_to("/users/#{User.find_by_username("sally").id}/goals")
      end
    end

    context "with invalid credentials" do
      it "validates presence of username and password" do
        post :create, user: { username: "sally" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end
  end
end
