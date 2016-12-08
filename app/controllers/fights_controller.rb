require "scraper"

class FightsController < ApplicationController
  skip_before_action :authenticate_user!
  helper_method :winner_name

  def index
    # @fights = Fight.all
    # current_user.fights
    @fights = current_user.fights
  end

  def show
    @fight = Fight.find(params[:id])
  end

  def new
    @fight = Fight.new
  end

  def create
    # 1) Instantier les 2 insta user
    @challenger = Scraper.new.scrap(params[:challenger])
    @opponent = Scraper.new.scrap(params[:opponent])

    if !@challenger || !@opponent
      flash[:alert] = "The username you have entered does not exist, retry!"
      return redirect_to root_path
    end
    # 1.2) L'insta-user  n'existe pas => on le crée
    # 2) on calcule les scores des insta user
    # @challenger = InstaUser.find(params[:fight][:challenger_id])
    @challenger_score = Score.new(@challenger)
    @challenger_follower_score = @challenger_score.followers_score
    @challenger_media_score = @challenger_score.media_score
    @challenger_engagement_score = @challenger_score.engagement_score
    @challenger_final_score = @challenger_follower_score + @challenger_media_score + @challenger_engagement_score

    # @opponent = InstaUser.find(params[:fight][:opponent_id])
    @opponent_score = Score.new(@opponent)
    @opponent_follower_score = @opponent_score.followers_score
    @opponent_media_score = @opponent_score.media_score
    @opponent_engagement_score = @opponent_score.engagement_score
    @opponent_final_score = @opponent_follower_score + @opponent_media_score + @opponent_engagement_score
    # 3) On créee la fight

 if @opponent_final_score == 0 || @challenger_final_score == 0
      flash[:alert] = "The username you have entered is private, try another username, like Beyonce !"
      return redirect_to root_path
    end



    @fight = Fight.new(
      challenger_id: @challenger.id, follower_score_challenger: @challenger_follower_score, media_score_challenger: @challenger_media_score,
      engagement_score_challenger: @challenger_engagement_score, final_score_challenger: @challenger_final_score,
      opponent_id: @opponent.id, follower_score_opponent: @opponent_follower_score, media_score_opponent: @opponent_media_score,
      engagement_score_opponent: @opponent_engagement_score, final_score_opponent: @opponent_final_score)

    if user_signed_in?
      @fight.user = current_user
    end

    if @fight.save
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  def winner_name
     @fight = Fight.find(params[:id])
     if @fight.final_score_challenger > @fight.final_score_opponent
       "@" + @fight.challenger.username.upcase + " WINS"
     elsif @fight.final_score_challenger < @fight.final_score_opponent
       "@" + @fight.opponent.username.upcase + " WINS"
     else
       return "IT'S A DRAW !!"
     end
   end



  private

  def params_fight
    params.require(:fight).permit(:challenger_id, :opponent_id)
  end
end





