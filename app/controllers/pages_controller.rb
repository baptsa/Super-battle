class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

     client = Instagram.client(:access_token => current_user.token)
     @users = client.user_search("j")


    client = Instagram.client(:access_token => current_user.token)
     @follows = client.user(@users[0].id)

     client = Instagram.client(:access_token => current_user.token)
      @recent_media = client.user_recent_media(@users[0].id)

  end









end
