   require "instagram"

    Instagram.configure do |config|
      config.client_id =  ENV["IG_ID"]
      config.client_secret = ENV["IG_SECRET"]
    end
