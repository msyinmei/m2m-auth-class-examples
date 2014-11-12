class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    id = params[:id]
    @course = Course.where(id: id).first
  end

  def edit
    id = params[:id]
    @course = Course.where(id: id).first
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, flash: {success: "Congratulations, you've added a new course"}
    else
      render :new
    end
  end

  def update
    id = params[:id]
    course = Course.find_by_id(id)
    course.name = course_params[:name]
    course.save
      redirect_to courses_path, flash: {success: "Congratulations, you've updated a course"}
  end

  def destroy
    id = params[:id]
    course = Course.find_by_id(id)
    course.destroy
      redirect_to courses_path, flash: {success: "Congratulations, you have deleted a course"}
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end
end
