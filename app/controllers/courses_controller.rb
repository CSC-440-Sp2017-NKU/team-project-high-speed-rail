class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course added."
      redirect_to @course
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = "Course updated."
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to(request.referrer || root_path)
  end
  
  private
  
    def course_params
      params.require(:course).permit(:code, :title, :days, :start_time, :end_time)
    end
    
    def set_course
      @course = Course.find(params[:id])
    end
end
