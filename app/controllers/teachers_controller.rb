class TeachersController < ApplicationController
  include ApplicationHelper
  include TeachersHelper
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :teacher?, only: [:index, :edit, :update, :destroy]


  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        old_user_type = session[:user_type]
        session[:user_id] = @teacher.id unless session[:user_id]
        if old_user_type == nil
          session[:user_type] = params[:teacher][:user_type]
          format.html { redirect_to root_path, notice: 'Teacher was successfully created.' }
        elsif already_logged_in? && is_teacher?
          format.html { redirect_to teachers_path, notice: 'Teacher was successfully created.' }
        else
          format.html { redirect_to root_path, notice: "ACCESS DANAI'D" }
        end
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teachers_path, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:name, :email, :password_digest, :user_type)
    end
end
