class UsersController < ApplicationController
  def index
    @users = User.includes(:events)
  end

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @events = Event.where(user_id: current_user)
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_events_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

end
