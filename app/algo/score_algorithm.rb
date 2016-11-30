def score_media(insta_user)
  media = insta_user.media
  interval1 = 2
  interval1 = 10
  interval2 = 30
  interval3 = 50
  interval4 = 70
  interval5 = 100
  interval6 = 150
  interval7 = 200
  interval8 = 300
  interval9 = 500
  interval10 = 1000
  media_score = 0
  if media < interval1
    media_score = points * 1
    return media_score
  elsif media < interval2
    media_score = points * 2
    return media_score
  elsif media < interval3
    media_score = points * 3
    return media_score
  elsif media < interval4
    media_score = points * 4
    return media_score
  elsif media < interval5
    media_score = points * 5
    return media_score
  elsif media < interval6
    media_score = points * 6
    return media_score
  elsif media < interval7
    media_score = points * 7
    return media_score
  elsif media < interval8
    media_score = points * 8
    return media_score
  elsif media < interval9
    media_score = points * 9
    return media_score
  else
    media_score = points * 10
    return media_score
  end
   # for i in 1..9
  #   return_media(i)
  # end

  # def return_media(number)
  #   elseif media < "media#{number}".to_sym
  #     media = points * "number".to_i
  #     return media
  #   end
  # end
end


def score_followers(insta_user)
  score = 0
  followed_by = insta_user.followed_by
  if followed_by < 100
    score += 0
  elsif followed_by >= 100 && followed_by < 200
    score += 2
  elsif followed_by >= 200 && followed_by < 500
    score += 5
  elsif followed_by >= 500 && followed_by < 1000
    score += 9
  elsif followed_by >= 1000 && followed_by < 2000
    score += 13
  elsif followed_by >= 2000 && followed_by < 4000
    score += 17
  elsif followed_by >= 4000 && followed_by < 8000
    score += 21
  elsif followed_by >= 8000 && followed_by < 12000
    score += 25
  elsif followed_by >= 12000 && followed_by < 20000
    score += 30
  elsif followed_by >= 20000 && followed_by < 50000
    score += 35
  elsif followed_by >= 50000
    score += 40
end

