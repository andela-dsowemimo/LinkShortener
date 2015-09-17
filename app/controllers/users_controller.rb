class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to(@user, notice: "Your Profile has been Successfully Created")
    else
      flash[:danger] = "Please provide a valid email address or password"
      redirect_to(new_user_path)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to(@user, notice: "Your Profile has been Successfully Updated")
    else
      flash[:danger] = "Enter Valid Details! Your Profile Update was Unsuccessful"
      redirect_to(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
