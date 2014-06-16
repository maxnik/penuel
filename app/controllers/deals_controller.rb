class DealsController < ApplicationController
  before_action only: [:new, :create, :edit, :update, :destroy] { authorize_for(:coach) }
  before_filter only: [:index] { authorize_for(%w(coach sponsor)) }

  before_filter :set_deal, only: [:edit, :update, :destroy]

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.user = current_user
    if @deal.save
      redirect_to transactions_url
    else
      render action: 'new'
    end
  end

  def index
    @deals = Deal.all
  end

  def edit
  end

  def update
    if @deal.update_attributes(deal_params)
      redirect_to transactions_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @deal.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def deal_params 
    params.require(:deal).permit(:description_ru, :description_en, :amount, :kind)
  end

  def set_deal
    @deal = Deal.find(params[:id])
    unless current_user.admin? || @deal.user_id == current_user.id
      redirect_to transactions_url 
    end
  end
end
