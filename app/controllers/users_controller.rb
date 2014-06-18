class UsersController < ApplicationController
  before_action { authorize_for(:admin) }
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :load_teams, only: [:new, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      load_teams
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
      load_teams
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :name_ru, :name_en, :locale, :role, team_ids: [])
  end 

  def set_user
    @user = User.find(params[:id])
  end

  def load_teams
    @teams = Team.all
  end
end
