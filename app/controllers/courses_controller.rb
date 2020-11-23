class CoursesController < ApplicationController

  before_action :logged_in_user, except: :list

  def index
    @courses = Course.all
  end

  def list
    @courses ||= []

    #@teacher = Teacher.find_by(user_id: current_user.id)

    #@courses = Course.where("teacher_id = ?", @teacher.id)
    @courses = Course.all
    #debugger
  end

  def show
    @course = Course.find(params[:id])
    @teacher = Teacher.find_by(id: @course.teacher_id)
  end

  def new
    @course = Course.new
    @user = current_user
    @teacher = Teacher.find_by(user_id: @user.id)
    @course.teacher_id = @teacher.id
  end

  def create
    @course = Course.new(course_params)
    DeliveryBoy.deliver_async(course_params.to_json, topic: "courses")

  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(course_params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated!"
      redirect_to @course
    else
        flash.now[:danger] = "Course Not updated due to empty name"
        render 'edit'
    end
  end

  def destroy
    @assignments = Assignment.where("course_id = ?", params[:id])
    if @assignments
      @assignments.each do |a|
        a.delete
      end
    end
    Course.find(params[:id]).delete
    redirect_to courses_list_url
  end


  private
  def course_params
    params.require(:course).permit(:id, :name, :teacher_id)
  end

end
