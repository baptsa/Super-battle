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
