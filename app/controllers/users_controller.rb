class UsersController < ApplicationController
  before_action :user_set, only:[:show,:edit,:update]
  def show
    @contents = @user.contents
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
  def user_set
    @user = User.find(params[:id])
  end
end