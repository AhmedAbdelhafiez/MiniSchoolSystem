require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensures username is presence" do
      user = User.new().save
      expect(user).to eq(false)
    end

    it "ensures fullname is presence" do
      user = User.new(username: "test").save
      expect(user).to eq(false)
    end

    it "ensures dateOfBirth is presence" do
      user = User.new(username: "test Username", fullname: "test FullName").save
      expect(user).to eq(false)
    end

    it "ensures everthing is exist" do
      user = User.new(username: "test Username", fullname: "test FullName", dateOfBirth: DateTime.now).save
      expect(user).to eq(true)
    end
  end
end
