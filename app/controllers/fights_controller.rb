class FightsController < ApplicationController
  def index
    @fights = Fight.current_user
  end

  def show
    @fight = Fight.find(params[:id])
  end

  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(params_fight)
    if @fight.save
      redirect_to fight_path(@fight)
    else
      redirect_to root_path
  end

  private

  def params_fight
    params.require(:fight).permit(:challenger_id, :opponent_id)
  end

end


