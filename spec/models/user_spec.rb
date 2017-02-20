require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "associations" do
  end

  describe "class methods" do
    describe "::generate_session_token" do
      it "generates a url safe random 16 character string"
    end

    describe "::find_by_credentials" do
      context "when the user is in the database" do
        it "returns the user with the matching credentials"
      end

      context "when the user is not in the database" do
        it "returns nil"
      end
    end

  end

  describe "instance methods" do
    describe "#reset_session_token!" do
      it "changes the users session token"
    end

    describe "#password=" do
      it "creates a password digest using BCrypt and saves it into the database"

      it "does not save the password"
    end

    describe "#is_password?" do
      it "uses BCrypt to validate the password"
    end

  end
end
