class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)
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
  end

  def destroy
  end

  private 

  def create_user_params 
    params.require(:user).permit(:email, :name_ru, :name_en, :locale, :role)
  end 
end
