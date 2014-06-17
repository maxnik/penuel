class EquipmentController < ApplicationController
  before_action only: [:new, :create, :edit, :update, :destroy] { authorize_for(:admin) }
  before_action :set_equipment, only: [:edit, :update, :destroy]
  before_action :load_teams, only: [:new, :edit]

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to equipment_index_url
    else
      load_teams
      render action: 'new'
    end
  end

  def index
    @equipment = Equipment.all
  end

  def edit
  end

  def update
    if @equipment.update_attributes(equipment_params)
      redirect_to equipment_index_url
    else
      load_teams
      render action: 'edit'
    end
  end

  def destroy
    @equipment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name_ru, :name_en, :quantity, :price, team_ids: [])
  end

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def load_teams
    @teams = Team.all
  end
end
