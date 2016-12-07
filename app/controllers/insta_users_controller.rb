class InstaUsersController < ApplicationController
  def new
    @insta_user = InstaUser.new()
  end

  def create
  end

   def autocomplete
    client = Instagram.client(:access_token => "1396122422.8121a2b.120c5c5852944ba1a82a69f4da119392")
    value = client.user_search(params[:query])
    @username = value[0]["username"]
    respond_to do |format|
      format.json { render json: { "username" => @username } }
    end
  end
end


