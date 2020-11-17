require 'rails_helper'

RSpec.describe Course, type: :model do
  context "validation tests" do
    it "ensures course name is presence" do
      course = Course.new().save
      expect(course).to eq(false)
    end

    it "ensures everything is Ok" do
      course = Course.new(name: "Test Course").save
      expect(course).to eq(true)
    end
  end
end
