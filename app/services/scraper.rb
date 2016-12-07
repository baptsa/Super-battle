require 'open-uri'
require 'nokogiri'
require 'json'

class Scraper
  def scrap(username)
    begin
      doc = Nokogiri::HTML(open("https://www.instagram.com/#{username}/"))
      userinfo = JSON.parse doc.search("script")[-5].children.first.content.split(" = ").last.split(";").first

      username = username
      profile_picture = userinfo["entry_data"]["ProfilePage"][0]["user"]["profile_pic_url"]

      followed_by = userinfo["entry_data"]["ProfilePage"][0]["user"]["followed_by"]["count"]
      follows = userinfo["entry_data"]["ProfilePage"][0]["user"]["follows"]["count"]
      media = userinfo["entry_data"]["ProfilePage"][0]["user"]["media"]["count"]
      sum = 0

      nodes = userinfo["entry_data"]["ProfilePage"][0]["user"]["media"]["nodes"]
      nodes.each do |node|
        sum += node["likes"]["count"].to_i
        sum += node["comments"]["count"].to_i
      end

      engagement = ((sum.fdiv(nodes.size)).fdiv(followed_by) * 100).round
      insta_user_params = { username: username, profile_picture: profile_picture, followed_by: followed_by, follow: follows, media: media, engagement: engagement }
      insta_user = InstaUser.find_by(username: username)

      if insta_user
        insta_user.update(insta_user_params)
      else
        insta_user = InstaUser.create(insta_user_params)
      end

      return insta_user
      rescue OpenURI::HTTPError => e
      return false
      end
    end
  end

# p = Scraper.new.scrap("jo.mo1")

