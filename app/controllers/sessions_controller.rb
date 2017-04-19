class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed in"
      redirect_to root_path
    else
      flash[:alert] = "Sign in not successful"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out"
    redirect_to root_path
  end

end
