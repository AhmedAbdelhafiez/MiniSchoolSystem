class AssignmentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :update]

  def index
    @assignments = Assignment.all
  end

  def list
    @assignments = []
    if teacher_user?
      if @course
        @assignments = @course.assignments
      end
    else
      @user = current_user
      @student = Student.find_by(user_id: @user.id)
      #debugger
      @assignments = Assignment.where("student_id = ?", @student.id)
    end
  end

  def list_for_course
    @course = Course.find(params[:id])
    @assignments = @course.assignments
    render 'assignments/list'
  end

  def show
    @assignment = Assignment.find(params[:id])
    @student = Student.find_by(id: @assignment.student_id)
    @student = User.find_by(id: @student.user_id)
    @course = @assignment.course
  end

  def new
    @students = []
    Student.all.each do |s|
      @user = User.find_by(id: s.user_id)
      @user.id = s.id
      @students << @user
    end
    @assignment = Assignment.new
    @course = Course.find(params[:id])
    @assignment.course_id = @course.id
    #@course = Course.find(params[:id])
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.course_id = assignment_params[:course_id]
    if @assignment.save
        flash.now[:success] = "Assignment Successfully saved"
        list
    else
        flash.now[:danger] = "Assignment Not Saved"
        render 'new'
    end

  end

  def edit
    @assignment = Assignment.find(params[:id])
    @students = []
    Student.all.each do |s|
      @user = User.find_by(id: s.user_id)
      @user.id = s.id
      @students << @user
    end
  end

  def update
    @assignment = Assignment.find(assignment_params[:id])
    if @assignment.update_attributes(assignment_params)
      flash[:success] = "Assignment updated!"
      redirect_to @assignment
    end
  end

  def destroy
    @assignment =  Assignment.find(params[:id])
    @course = Course.find_by(id: @assignment.course_id)
    @assignment.delete
    @assignments = @course.assignments
    render 'assignments/list'
  end

  private
  def assignment_params
    params.require(:assignment).permit(:id, :name, :course_id, :student_id)
  end
end
