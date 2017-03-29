require 'rails_helper'

RSpec.describe User, type: :model do
  context "validating user fields" do
  	before :each do
  		@user = User.create(name: "Nitesh", email: "njha@gmail.com", password: "password", password_confirmation: "password")
  	end

    it "tests presence of user name" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name].size).to eq(1)
    end

    it "test presence of email field" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email].size).to eq(2)
    end    	

    it "check user name length" do
    	@user.name = "#{"a" * 51}"
    	@user.valid?
    	expect(@user.errors[:name].size).to eq(1)
    end

    it "check user email length" do
    	@user.email = "#{"a" * 51}@gmail.com"
    	@user.valid?
    	expect(@user.errors[:email].size).to eq(1)
    end

    it "checks the user email formats" do
    	@user.email = "niteshgmail.com"
    	@user.valid?
    	expect(@user.errors[:email].size).to eq(1)

    	@user.email = "nitesh@@gmail.com"
    	@user.valid?
    	expect(@user.errors[:email].size).to eq(1)

    	@user.email = "nitesh@gmail"
    	@user.valid?
    	expect(@user.errors[:email].size).to eq(1)

    end

    it "check unique user email id" do
    	@user2 = User.new(name: "Nitesh", email: "njha@gmail.com", password: "password", password_confirmation: "password")
    	@user2.valid?
    	expect(@user2.errors[:email].size).to eq(1)
    end

    it "check password length" do
    	@user2 = User.new(name: "Nitesh", email: "njha1@gmail.com", password: "", password_confirmation: "")
    	@user2.valid?
    	expect(@user2.errors[:password].size).to eq(3)
    end

    it "check email is downcase" do
    	@user2 = User.new(name: "Nitesh", email: "njha1@gmail.com", password: "", password_confirmation: "")
    	@user2.valid?
    	expect(@user2.errors[:password].size).to eq(3)
    end

  end

end

