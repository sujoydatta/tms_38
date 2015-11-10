class Supervisor::UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]

  def index
    @users = User.send(params[:role].pluralize).paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.attributes = {role: User::ROLE[:trainee]}
    if @user.save
      flash[:success] = t(:add_trainee_sucessful_message)
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t(:delete_trainee_sucessful_message)
    redirect_to supervisor_users_path(role: User::ROLE[:trainee])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :role, :password,
                                   :password_confirmation)
    end

    # Before filters

    def load_user
      @user = User.find params[:id]
    end
end
