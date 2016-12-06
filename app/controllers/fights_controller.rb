require "scraper"

class FightsController < ApplicationController
  skip_before_action :authenticate_user!

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
      raise
      render :new
    end
  end

  private

  def params_fight
    params.require(:fight).permit(:challenger_id, :opponent_id)
  end

end




# class FightsController < ApplicationController
#   skip_before_action :authenticate_user!

#   def index
#     # @fights = Fight.all
#     # current_user.fights
#     @fights = current_user.fights

#   end

#   def show
#     @fight = Fight.find(params[:id])
#   end

#   def new
#     @fight = Fight.new
#   end

#   def create
#     # 1) Instantier les 2 insta user
#     #1.1) L'insta-user existe => on le récupère et on update
#     client = Instagram.client(:access_token => current_user.token)
#     insta_challenger = client.user_search(params[:challenger])
#     challenger_infos = client.user(insta_challenger[0].id)

#     username = challenger_infos.username
#     profile_picture = challenger_infos.profile_picture
#     followed_by = challenger_infos.counts.followed_by
#     follows = challenger_infos.counts.follows
#     media = challenger_infos.counts.media


#     recent_media = client.user_recent_media(insta_challenger[0].id)
#     like_counts = []
#     comments_counts = []
#     recent_media.each do |media|
#       like_counts << media.likes["count"]
#       comments_counts << media.comments["count"]
#     end
#     recent_media = recent_media.count
#     like_sum = like_counts.map(&:to_i).reduce(:+)
#     comments_sum = comments_counts.map(&:to_i).reduce(:+)
#     challenger_engagement = (like_sum + comments_sum) / recent_media

#     @challenger = InstaUser.new(username: username, profile_picture: profile_picture, followed_by: followed_by, follow: follows, media: media, engagement: challenger_engagement)
#     @challenger.save


#     client = Instagram.client(:access_token => current_user.token)
#     insta_opponent = client.user_search(params[:opponent])
#     opponent_infos = client.user(insta_opponent[0].id)

#     opponent_username = opponent_infos.username
#     opponent_profile_picture = opponent_infos.profile_picture
#     opponent_followed_by = opponent_infos.counts.followed_by
#     opponent_follows = opponent_infos.counts.follows
#     opponent_media = opponent_infos.counts.media


#     recent_media = client.user_recent_media(insta_opponent[0].id)
#     like_counts = []
#     comments_counts = []
#     recent_media.each do |media|
#       like_counts << media.likes["count"]
#       comments_counts << media.comments["count"]
#     end
#     recent_media = recent_media.count
#     like_sum = like_counts.map(&:to_i).reduce(:+)
#     comments_sum = comments_counts.map(&:to_i).reduce(:+)
#     opponent_engagement = (like_sum + comments_sum) / recent_media

#     @opponent = InstaUser.new(username: opponent_username, profile_picture: opponent_profile_picture, followed_by: opponent_followed_by, follow: opponent_follows, media: opponent_media, engagement: opponent_engagement)
#     @opponent.save
#     # 1.2) L'insta-user  n'existe pas => on le crée

#     # 2) on calcule les scores des insta user
#     # @challenger = InstaUser.find(params[:fight][:challenger_id])
#     @challenger_score = Score.new(@challenger)
#     @challenger_follower_score = @challenger_score.followers_score
#     @challenger_media_score = @challenger_score.media_score
#     @challenger_engagement_score = @challenger_score.engagement_score
#     @challenger_final_score = @challenger_follower_score + @challenger_media_score + @challenger_engagement_score
#     # @opponent = InstaUser.find(params[:fight][:opponent_id])
#     @opponent_score = Score.new(@opponent)
#     @opponent_follower_score = @opponent_score.followers_score
#     @opponent_media_score = @opponent_score.media_score
#     @opponent_engagement_score = @opponent_score.engagement_score
#     @opponent_final_score = @opponent_follower_score + @opponent_media_score + @opponent_engagement_score


#     # 3) On créee la fight
#     @fight = Fight.new(user: current_user, challenger_id: @challenger.id, follower_score_challenger: @challenger_follower_score, media_score_challenger: @challenger_media_score,
#       engagement_score_challenger: @challenger_engagement_score, final_score_challenger: @challenger_final_score, opponent_id: @opponent.id, follower_score_opponent: @opponent_follower_score, media_score_opponent: @opponent_media_score,
#       engagement_score_opponent: @opponent_engagement_score, final_score_opponent: @opponent_final_score, )
#     if @fight.save
#       redirect_to fight_path(@fight)
#     else
#       render :new
#     end
#   end

#   private

#   def params_fight
#     params.require(:fight).permit(:challenger_id, :opponent_id)
#   end

# end




