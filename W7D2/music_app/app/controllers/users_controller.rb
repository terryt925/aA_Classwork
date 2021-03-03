class UsersController < ApplicationController

def new
  render :new
end

def create
 @user = User.new(user_params)
  if @user.saves!
    login!(user)
    redirect_to users_url
  else
    render :new
  end
end

def show
  @users = User.find_by(id: params[:id])
  if @user
    render :show
  else
    redirect_to users_url
  end
end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
