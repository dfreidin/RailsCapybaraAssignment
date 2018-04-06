class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ['User successfully created']
      redirect_to user_path(@user)
    else
      #errors we need to code later
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end

  private
  def get_user
    @user = User.find(params[:id])
  end
end
