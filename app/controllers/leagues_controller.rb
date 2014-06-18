class LeaguesController < ApplicationController
  before_action only: [:new, :create, :edit, :update, :destroy] { authorize_for(:admin) }
  before_action :set_league, only: [:edit, :update, :destroy]
  before_action :load_teams, only: [:new, :edit]

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to leagues_url
    else
      load_teams
      render action: 'new'
    end
  end

  def index
    @leagues = League.all
  end

  def edit
  end

  def update
    if @league.update_attributes(league_params)
      redirect_to leagues_url
    else
      load_teams
      render action: 'edit'
    end
  end

  def destroy
    @league.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def league_params
    params.require(:league).permit(:name_ru, :name_en, :championship_page, team_ids: [])
  end

  def set_league
    @league = League.find(params[:id])
  end

  def load_teams
    @teams = Team.all
  end
end
