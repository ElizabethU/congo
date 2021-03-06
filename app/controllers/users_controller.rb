class UsersController < ApplicationController
  include ApplicationHelper
  before_action :current_user, :only => [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    respond_to do |format|
      if @users.save
        sign_in(@users)
        format.html { redirect_to @users, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @users.update(user_params)
        format.html { redirect_to @users, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @users.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private
   # Use callbacks to share common setup or constraints between actions.
   # Never trust parameters from the scary internet, only allow the white list through.
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end


