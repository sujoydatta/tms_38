class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]
  before_action :load_user, only: [:show]

  def index
    @users = User.trainees.paginate page: params[:page]
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t 'update_profile_sucessful_message'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :role, :password,
                                 :password_confirmation
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t 'login_message'
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end

  def load_user
    @user = User.find params[:id]
  end
end
