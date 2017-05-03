class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    authorize User
    @user = User.new
    @courses = Course.order(code: :asc, title: :asc)
  end

  # GET /users/1/edit
  def edit
    authorize @user
    @courses = Course.order(code: :asc, title: :asc)
  end

  # POST /users
  # POST /users.json
  def create
    if params[:usertype] == "registrar"
      @user = User.new_registrar(user_params)
    elsif params[:usertype] == "faculty"
      @user = User.new_faculty(user_params)
    else
      @user = User.new_student(user_params)
    end
    
    authorize @user

    respond_to do |format|
      if @user.save
        if @user.permission? :student
          params[:courses].each do |course_id|
            @user.enrolled_courses << Course.find(course_id)
          end
        elsif @user.permission? :faculty
          params[:courses].each do |course_id|
            @user.taught_courses << Course.find(course_id)
          end
        end
        
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        @courses = Course.order(code: :asc, title: :asc)
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    respond_to do |format|


      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        @courses = Course.order(code: :asc, title: :asc)
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
