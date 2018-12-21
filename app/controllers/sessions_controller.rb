class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      return redirect_to "/projects"
    else
      flash[:errors] = ["Invalid Combination"]
      return redirect_to '/projects'
    end
    
end
def destroy
    session[:user_id] = nil
    redirect_to '/'
end

private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
