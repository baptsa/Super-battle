def score_media(user)
  media = user.media
  points = 2
  media1 = 10
  media2 = 30
  media3 = 50
  media4 = 70
  media5 = 100
  media6 = 150
  media7 = 200
  media8 = 300
  media9 = 500
  media10 = 1000
  score_media = 0
  if media < media1
    return media = points * 1
  elsif media < media2
    return media = points * 2
  elsif media < media3
    return media = points * 3
  elsif media < media4
    return media = points * 4
  elsif media < media5
    return media = points * 5
  elsif media < media6
    return media = points * 6
  elsif media < media7
    return media = points * 7
  elsif media < media8
    return media = points * 8
  elsif media < media9
    return media = points * 9
  else
    return media = pf10 * 10
  end
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

