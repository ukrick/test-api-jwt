require 'rails_helper'

RSpec.describe User, type: :model do
  context "with valid attributes" do
    it "create a user with email & password" do
      user = User.create!(email: 'test@test.com', password: 'password')
      expect(user).to be_valid
    end
  end

  context "with invalid attributes" do
    it "create a user without a password" do
      user = User.new(email: 'test@test.com')
      expect(user).to_not be_valid
    end
  end
end
