require 'open-uri'
require 'nokogiri'
require 'json'

class Scraper
  def scrap(username)
    doc = Nokogiri::HTML(open("https://www.instagram.com/#{username}/"))
    userinfo = JSON.parse doc.search("script")[-5].children.first.content.split(" = ").last.split(";").first

    username = username
    profile_picture = userinfo["entry_data"]["ProfilePage"][0]["user"]["profile_pic_url"]

    followed_by = userinfo["entry_data"]["ProfilePage"][0]["user"]["followed_by"]["count"]
    follows = userinfo["entry_data"]["ProfilePage"][0]["user"]["follows"]["count"]
    media = userinfo["entry_data"]["ProfilePage"][0]["user"]["media"]["count"]
    sum = 0

    userinfo["entry_data"]["ProfilePage"][0]["user"]["media"]["nodes"].each do |node|
      sum += node["likes"]["count"]
      sum += node["comments"]["count"]
    end

    engagement = (sum.fdiv(media)).fdiv(followed_by).round
    insta_user_params = { username: username, profile_picture: profile_picture, followed_by: followed_by, follow: follows, media: media, engagement: engagement }
    insta_user = InstaUser.find_by(username: username)

    if insta_user
      insta_user.update(insta_user_params)
    else
      insta_user = InstaUser.create(insta_user_params)
    end

    return insta_user
  end
end

# p = Scraper.new.scrap("jo.mo1")

