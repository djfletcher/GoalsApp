require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:sally) { User.create!(username: "sally", password: "test123" ) }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
  end

  describe "class methods" do
    describe "::generate_session_token" do
      it "generates a url safe random 16 character string" do
        token1 = User.generate_session_token
        token2 = User.generate_session_token

        expect(token1).to be_a(String)
        expect(token1.size).to eq(16)
        expect(token1).not_to eq(token2)
      end
    end

    describe "::find_by_credentials" do

      context "when the user is in the database" do
        it "returns the user with the matching credentials" do
          expect(User.find_by_credentials(username: "sally", password: "test123"))
            .to eq(sally)
        end
      end

      context "when the user is not in the database" do
        it "returns nil" do
          expect(User.find_by_credentials(username: "hsdkhfgk", password: "test123"))
            .to be_nil
          expect(User.find_by_credentials(username: "sally", password: "dgadgdgg"))
            .to be_nil
        end
      end
    end

  end

  describe "instance methods" do
    describe "#reset_session_token!" do
      it "changes the users session token" do
        token = sally.session_token
        sally.reset_session_token!

        expect(token).not_to eq(sally.session_token)
      end
    end

    describe "#password=" do
      it "creates a password digest using BCrypt" do
        expect(:password=).to receive(BCrypt::Password.create)
        sally.password = "new_password"
      end

      it "saves the password digest into the database" do
        expect(sally.password_digest).to eq(BCrypt::Password.create("test123"))
      end

      it "does not save the password into the database" do
        expect(sally.password).to be_nil
      end
    end

    describe "#is_password?" do
      it "uses BCrypt to validate the password" do
        expect(:is_password?).to receive(BCrypt::Password.is_password?)

        expect(sally.is_password?("test123")).to be_true
        expect(sally.is_password?("new_password")).to be_false
      end
    end
  end
end
