class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :privacy ]


  def home
  end

  def privacy
  end

  def about
  end
end
