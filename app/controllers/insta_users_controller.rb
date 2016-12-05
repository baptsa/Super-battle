class InstaUsersController < ApplicationController

  def new
    @insta_user = InstaUser.new()
  end


  def create

    client = Instagram.client(:access_token => current_user.token)
    insta_challenger = client.user_search(params[:challenger])
    challenger_infos = client.user(insta_challenger[0].id)

    username = challenger_infos.username
    profile_picture = challenger_infos.profile_picture
    followed_by = challenger_infos.counts.followed_by
    follows = challenger_infos.counts.follows
    media = challenger_infos.counts.media


    recent_media = client.user_recent_media(insta_challenger[0].id)
    like_counts = []
    comments_counts = []
    recent_media.each do |media|
      like_counts << media.likes["count"]
      comments_counts << media.comments["count"]
    end
    recent_media = recent_media.count
    like_sum = like_counts.map(&:to_i).reduce(:+)
    comments_sum = comments_counts.map(&:to_i).reduce(:+)
    engagement = (like_sum + comments_sum) / recent_media

    @challenger = InstaUser.new(username: username, profile_picture: profile_picture, followed_by: followed_by, follow: follows, media: media, engagement: engagement)
    @challenger.save


    client = Instagram.client(:access_token => current_user.token)
    insta_opponent = client.user_search(params[:opponent])
    opponent_infos = client.user(insta_opponent[0].id)

    opponent_username = opponent_infos.username
    opponent_profile_picture = opponent_infos.profile_picture
    opponent_followed_by = opponent_infos.counts.followed_by
    opponent_follows = opponent_infos.counts.follows
    opponent_media = opponent_infos.counts.media


    recent_media = client.user_recent_media(insta_opponent[0].id)
    like_counts = []
    comments_counts = []
    recent_media.each do |media|
      like_counts << media.likes["count"]
      comments_counts << media.comments["count"]
    end
    recent_media = recent_media.count
    like_sum = like_counts.map(&:to_i).reduce(:+)
    comments_sum = comments_counts.map(&:to_i).reduce(:+)
    opponent_engagement = (like_sum + comments_sum) / recent_media

    @opponent = InstaUser.new(username: opponent_username, profile_picture: opponent_profile_picture, followed_by: opponent_followed_by, follow: opponent_follows, media: opponent_media, engagement: opponent_engagement)
    @opponent.save

  end

   def autocomplete
    client = Instagram.client(:access_token => "1396122422.8121a2b.120c5c5852944ba1a82a69f4da119392")
    value = client.user_search(params[:query])
    @username = value[0]["username"]

    respond_to do |format|
      format.json { render json: { "username" => @username } }
    end
    # value = params[:query]
    # client = Instagram.client(:access_token => current_user.token)
    # # search = client.user_search(params[:query])
    # render json: []
  end


end


