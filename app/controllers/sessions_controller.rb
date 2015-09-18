class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to(user, notice: "Welcome #{user.name.titleize}")
    else
      flash[:danger] = "Your password or email is Invalid"
      redirect_to(login_path)
    end
  end

  def destroy
    log_out
    redirect_to(root_url, notice: "You have Successfully Logged Out")
  end
end
