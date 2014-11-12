class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, flash: {success: "Congratulations, you've added a new student"}
    else
      render :new
    end
  end

  def show
    @id = params[:id]
    @student = Student.where(id: @id).first
  end

  def edit
    id = params[:id]
    @student = Student.find_by_id(id)
  end

  def enroll

  end

  # Don't do this yet....
  def create_enrollment

  end

  def update
    id = params[:id]
    student = Student.find_by_id(id)
    student.update(name: student_params[:name])
      redirect_to students_path, flash: {success: "Congratulations! You have updated a student"}
  end

  def destroy
    id = params[:id]
    student = Student.find_by_id(id)
    student.destroy
      redirect_to students_path, flash: {success: "Congratulations! You have deleted a student"}

  end

  private
  def student_params
    params.require(:student).permit(:name)
  end
end
