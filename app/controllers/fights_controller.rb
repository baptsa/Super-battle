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
  end

  def create
    @challenger = InstaUser.find(params[:fight][:challenger_id])
    @challenger_score = Score.new(@challenger)
    @challenger_follower_score = @challenger_score.follower_score
    @challenger_media_score = @challenger_score.media_score
    @challenger_engagement_score = @challenger_score.engagement_score
    @challenger_final_score = @challenger_follower_score + @challenger_media_score + @challenger_engagement_score
    @opponent = InstaUser.find(params[:fight][:opponent_id])
    @opponent_score = Score.new(@opponent)
    @opponent_follower_score = @opponent_score.follower_score
    @opponent_media_score = @opponent_score.media_score
    @opponent_engagement_score = @opponent_score.engagement_score
    @opponent_final_score = @opponent_follower_score + @opponent_media_score + @opponent_engagement_score
    @fight = Fight.new(challenger_id: @challenger.id, follower_score_challenger: @challenger_follower_score, media_score_challenger: @challenger_media_score,
      engagement_score_challenger: @challenger_engagement_score, final_score_challenger: @challenger_final_score, opponent_id: @opponent.id, follower_score_opponent: @opponent_follower_score, media_score_opponent: @opponent_media_score,
      engagement_score_opponent: @opponent_engagement_score, final_score_opponent: @opponent_final_score)
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


