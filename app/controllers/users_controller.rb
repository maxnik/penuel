class UsersController < ApplicationController
  before_action :authorize
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      render action: 'new'
    end 
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_url
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :name_ru, :name_en, :locale, :role)
  end 

  def set_user
    @user = User.find(params[:id])
  end
end
