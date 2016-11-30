def followers_score(insta_user)
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
end
def engagement_score(insta_user)
  score = 0
  engagement = insta_user.engagement / insta_user.followed_by
  if insta_user.followed_by < 100
    if engagement < 0.1
      return score
    elsif engagement < 0.2
      score += 2
    elsif engagement < 0.3
      score += 10
    elsif engagement < 0.4
      score += 25
    elsif engagement < 0.5
      score += 30
    elsif engagement >= 0.5
      score += 40
    end
  elsif insta_user.followed_by >= 100 && insta_user.followed_by < 500
    if engagement < 0.08
      return score
    elsif engagement < 0.16
      score += 2
    elsif engagement < 0.2
      score += 10
    elsif engagement < 0.3
      score += 25
    elsif engagement < 0.4
      score += 30
    elsif engagement >= 0.5
      score += 40
    end
  elsif insta_user.followed_by >= 500 && insta_user.followed_by < 5000
    if engagement < 0.02
      return score
    elsif engagement < 0.04
      score += 2
    elsif engagement < 0.07
      score += 10
    elsif engagement < 0.1
      score += 25
    elsif engagement < 0.15
      score += 30
    elsif engagement >= 0.15
      score += 40
    end
  elsif insta_user.followed_by >= 5000
    if engagement < 0.01
      return score
    elsif engagement < 0.02
      score += 2
    elsif engagement < 0.04
      score += 10
    elsif engagement < 0.07
      score += 25
    elsif engagement < 0.1
      score += 30
    elsif engagement >= 0.1
      score += 40
    end
  end
end



