class EventsController < ApplicationController
  before_action only: [:new, :create, :edit, :update, :destroy] { authorize_for(:coach) }
  before_filter :set_event, only: [:edit, :update, :destroy]

  before_action :load_teams, only: [:new, :edit]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      if @event.archived?
        redirect_to archive_events_url
      else
        redirect_to events_url
      end
    else
      load_teams
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      if @event.archived?
        redirect_to archive_events_url
      else
        redirect_to events_url
      end
    else
      load_teams
      render action: 'edit'
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.js
    end
  end

  def archive
    @events = Event.archived
  end

  def index
    @events = Event.current
  end

  private

  def event_params
    params.require(:event).permit(:name_ru, :name_en, :result_ru, :result_en, :when_date, 
                                  team_ids: [])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def load_teams
    @teams = Team.all
  end
end
