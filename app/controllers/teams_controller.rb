class TeamsController < ApplicationController
  before_action only: [:new, :create, :edit, :update, :destroy] { authorize_for(:admin) }
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :load_coaches, only: [:new, :edit]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_url
    else
      load_coaches
      render action: 'new'
    end
  end

  def index
    @teams = Team.all
  end

  def show
  end 

  def edit
  end

  def update
    if @team.update_attributes(team_params)
      redirect_to teams_url
    else
      load_coaches
      render action: 'edit'
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.js
    end
  end

  private 

  def team_params
    params.require(:team).permit(:name_ru, :name_en, :championship_page, coach_ids: [])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def load_coaches
    @coaches = User.coaches
  end
end
