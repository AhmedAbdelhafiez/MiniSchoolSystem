require 'rails_helper'
require 'spec_test_helper'
require 'sessions_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:courses) {FactoryBot.create_list(:random_course, 5)}
  let!(:course) {FactoryBot.create(:random_course)}
  let!(:teacher) {FactoryBot.create(:random_teacher)}
  before do
    user = User.create!(username: "test", fullname: "testtest", dateOfBirth: Date.new)
    login user
  end
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      #debugger
      #expect(JSON.parse(response.body).size).to eq(20)
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
      #expect(response.status).to have_http_status(:found)# response.success?
    end
  end

  context 'GET #list' do
    it 'returns a success response' do

      get :list
      #debugger
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
      #expect(JSON.parse(response.body).size).to eq(20)
      #expect(response.status).to have_http_status(:found)# response.success?
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: course.id }
      #debugger
      expect(response.body).to be_truthy
      expect(response.status).to be(200) #found
      #expect(JSON.parse(response.body)['name']).to eq('test_course')
    end
  end

  context 'Post #create' do
    it 'returns a success response' do
      expect(response.body).to be_truthy
      expect(response.status).to be(200)
      #debugger
      #expect(JSON.parse(response.body)['name']).to eq('test_course')
    end
  end

  context 'Post #update' do
    it 'returns a success response' do
      #course_params = Hash.new
      #course_params.require(:course).permit(:id, :name, :teacher_id)
      #course_params[:name] = "updated";
      course_params = { id: 1, name: "updated", teacher_id: teacher.id}
      #debugger
      #post :update, params: course_params

      put :delete, params: {id: course.id, name: "updated"}

      expect(response.status).to be(200)

      #expect(JSON.parse(response.body)['name']).to eq('test_course')
    end
  end


  context 'Delete #delete' do
    it 'returns a success response' do
      course = Course.create!(name: "testCourse")
      delete :delete, params: { id: course.id }
      expect(response.status).to be(200)
    end
  end

end