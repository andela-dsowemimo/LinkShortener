class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end
  
  def create
    @user = User.new(user_params)
    # redirect_to @user if @user.save
    # render "new" unless @user.save
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
