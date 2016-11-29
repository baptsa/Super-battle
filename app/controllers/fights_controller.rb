class FightsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @fights = Fight.all # trop de fights (what if 100000 fights)
    current_user.fights
  end

  def show
    @fight = Fight.find(params[:id])
  end

  def new
    @fight = Fight.new
    @insta_users = InstaUser.all
  end

  def create
    @fight = Fight.new(params_fight)
    if @fight.save
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  private

  def params_fight
    params.require(:fight).permit(:challenger_id, :opponent_id)
  end

end


