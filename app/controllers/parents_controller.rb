class ParentsController < ApplicationController
  include ApplicationHelper
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :teacher?, except: [:index, :show]

  def index
    @parents = Parent.all
  end

  def show
  end

  def new
    @parent = Parent.new
  end

  def edit
  end

  def create
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save
        format.html { redirect_to parents_path, notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to parents_path, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:student_id, :name, :email, :password_digest, :user_type)
  end
end
