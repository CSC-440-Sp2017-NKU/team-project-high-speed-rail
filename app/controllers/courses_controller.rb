class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    authorize Course
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    
    if params[:days].any?
      days = "";
      params[:days].each do |day|
        if day == "monday"
          days += "M"
        end
        if day == "tuesday"
          days += "T"
        end
        if day == "Wednesday"
          days += "W"
        end
        if day == "thursday"
          days += "R"
        end
        if day == "friday"
          days += "F"
        end        
      end
      @course.days = days
    end

    authorize @course
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
    @course = Course.new(course_params)
    
    if params[:days].any?
      days = "";
      params[:days].each do |day|
        if day == "monday"
          days += "M"
        end
        if day == "tuesday"
          days += "T"
        end
        if day == "Wednesday"
          days += "W"
        end
        if day == "thursday"
          days += "R"
        end
        if day == "friday"
          days += "F"
        end        
      end
      @course.days = days
    end
    authorize @course
    if @course.update(course_params)
      flash[:success] = "Course updated."
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    authorize @course
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
