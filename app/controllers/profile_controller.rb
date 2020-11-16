class ProfileController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
      @user = current_user

      if teacher_user?
        @profile = Teacher.find_by(user_id: @user.id)
        @profile_type = "Teacher"
      else
        @profile = Student.find_by(user_id: @user.id)
        @profile_type = "Student"
      end
  end

  def edit
  end
end
