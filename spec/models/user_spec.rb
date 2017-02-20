require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "associations"

  describe "class methods" do
    describe "::generate_session_token"

    describe "::find_by_credentials"

  end

  describe "instance methods" do
    describe "#reset_session_token!"

    describe "#password="

    describe "#is_password?"

  end

end
