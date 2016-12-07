class InstaUsersController < ApplicationController

  def new
    @insta_user = InstaUser.new()
  end

  def create
    # @challenger = InstaUser.new(username: username, profile_picture: profile_picture, followed_by: followed_by, follow: follows, media: media, engagement: engagement)
    # @challenger.save
    # @opponent = InstaUser.new(username: opponent_username, profile_picture: opponent_profile_picture, followed_by: opponent_followed_by, follow: opponent_follows, media: opponent_media, engagement: opponent_engagement)
    # @opponent.save
  end

   # def autocomplete
   #  client = Instagram.client(:access_token => "1396122422.8121a2b.120c5c5852944ba1a82a69f4da119392")
   #  value = client.user_search(params[:query])
   #  @username = value[0]["username"]

   #  respond_to do |format|
   #    format.json { render json: { "username" => @username } }
   #  end
    # value = params[:query]
    # client = Instagram.client(:access_token => current_user.token)
    # # search = client.user_search(params[:query])
    # render json: []
  # end
end


