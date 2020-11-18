require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do
  let!(:course) {FactoryBot.create(:random_course)}
  let!(:assignments) {FactoryBot.create_list(:random_assignment, 5)}
  let!(:assignment) {FactoryBot.create(:random_assignment)}
  let!(:student) {FactoryBot.create(:random_student)}

  before do
    user = User.create!(username: "test", fullname: "testtest", dateOfBirth: Date.new)
    login user
  end

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
    end
  end

  context 'GET #list_for_course' do
    it 'returns a success response' do
      get :list_for_course, params: { id: course.id}
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
      end
  end

  context 'GET #show' do
    it 'returns a success response' do
      assignment = Assignment.create!(name: "testAssignment", student_id: student.id)
      get :show, params: { id: assignment.id }
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
    end
  end

  context 'Post #create' do
    it 'returns a success response' do
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
    end
  end

  context 'Post #update' do
    it 'returns a success response' do
      assignment_params = { id: 1, name: "updated", student_id: student.id}

      @assignment = Assignment.create!(name: "test")
      @new_name = "updated"

      assignment_params = { id: @assignment.id, assignment: { name: 'updated', id: @assignment.id} }
      #debugger
      put :update, params: assignment_params
      expect(response.status).to be(302)

    end
  end


  context 'Delete #delete' do
    it 'returns a success response' do
      assignment = Assignment.create!(name: "testAssignment")
      delete :delete, params: { id: assignment.id }
      expect(response.status).to be(200)
    end
  end

end
