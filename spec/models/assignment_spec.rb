require 'rails_helper'

RSpec.describe Assignment, type: :model do
  context "validation tests" do
    it "ensures assignment name is presence" do
      assignment = Assignment.new().save
      expect(assignment).to eq(false)
    end

    it "ensures everything is Ok" do
      
    end
  end
end
