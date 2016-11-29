class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @popular = Instagram.user_search("fantasticmisterzguy")
  end
end
