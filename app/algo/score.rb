class Score
  attr_accessor :insta_user

  def initialize(insta_user)
    @insta_user = insta_user
  end

  def followers_score
    score = 0
    followed_by = @insta_user.followed_by
    if followed_by < 100
      score = 1
    elsif followed_by < 200
      score = 2
    elsif followed_by < 400
      score = 3
    elsif followed_by < 600
      score = 4
    elsif followed_by < 800
      score = 5
    elsif followed_by < 1000
      score = 6
    elsif followed_by < 1500
      score = 7
    elsif followed_by < 2000
      score = 8
    elsif followed_by < 3000
      score = 9
    elsif followed_by < 5000
      score = 10
    elsif followed_by < 8000
      score = 11
    elsif followed_by < 12000
      score = 12
    elsif followed_by < 20000
      score = 13
    elsif followed_by < 40000
      score = 14
    elsif followed_by < 100000
      score = 15
    elsif followed_by < 200000
      score = 16
    elsif followed_by < 500000
      score = 17
    elsif followed_by < 1000000
      score = 18
    elsif followed_by < 2000000
      score = 19
    elsif followed_by < 5000000
      score = 20
    elsif followed_by < 10000000
      score = 22
    elsif followed_by < 20000000
      score = 24
    elsif followed_by < 30000000
      score = 26
    elsif followed_by < 40000000
      score = 28
    elsif followed_by < 50000000
      score = 30
    elsif followed_by < 60000000
      score = 32
    elsif followed_by < 70000000
      score = 34
    elsif followed_by < 80000000
      score = 36
    elsif followed_by < 90000000
      score = 38
    elsif followed_by < 100000000
      score = 40
    elsif followed_by >= 100000000
      score = 42
    end
  end

  def media_score
    media = @insta_user.media.to_i
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
    points = 2

    if media < interval1
      media_score = 0
    elsif media < interval2
      media_score = points * 1
    elsif media < interval3
      media_score = points * 2
    elsif media < interval4
      media_score = points * 3
    elsif media < interval5
      media_score = points * 4
    elsif media < interval6
      media_score = points * 5
    elsif media < interval7
      media_score = points * 6
    elsif media < interval8
      media_score = points * 7
    elsif media < interval9
      media_score = points * 8
    elsif media < interval10
      media_score = points * 9
    else
      media_score = points * 10
    end
     # for i in 1..9
    #   return_media(i)
    # end

    # def return_media(number)
    #   elseif media < "media#{number}".to_sym
    #     media = points * "number".to_i
    #   end
    # end
  end


  def engagement_score
    score = 0
    engagement = @insta_user.engagement
    # if @insta_user.followed_by < 100
      if engagement < 1
        score += 1
      elsif engagement < 2
        score += 5
      elsif engagement < 3
        score += 7
      elsif engagement < 4
        score += 10
      elsif engagement < 5
        score += 12
      elsif engagement < 7
        score += 15
      elsif engagement < 9
        score += 20
      elsif engagement < 11
        score += 23
      elsif engagement < 13
        score += 25
      elsif engagement < 15
        score += 30
      elsif engagement >= 15
        score += 40
      end
  #   elsif @insta_user.followed_by >= 100 && @insta_user.followed_by < 500
  #     if engagement <
  #       return score
  #     elsif engagement < 0.16
  #       score += 2
  #     elsif engagement < 0.2
  #       score += 10
  #     elsif engagement < 0.3
  #       score += 25
  #     elsif engagement < 0.4
  #       score += 30
  #     elsif engagement >= 0.5
  #       score += 40
  #     end
  #   elsif @insta_user.followed_by >= 500 && @insta_user.followed_by < 5000
  #     if engagement < 0.02
  #       return score
  #     elsif engagement < 0.04
  #       score += 2
  #     elsif engagement < 0.07
  #       score += 10
  #     elsif engagement < 0.1
  #       score += 25
  #     elsif engagement < 0.15
  #       score += 30
  #     elsif engagement >= 0.15
  #       score += 40
  #     end
  #   elsif @insta_user.followed_by >= 5000
  #     if engagement < 0.01
  #       return score
  #     elsif engagement < 0.02
  #       score += 2
  #     elsif engagement < 0.04
  #       score += 10
  #     elsif engagement < 0.07
  #       score += 25
  #     elsif engagement < 0.1
  #       score += 30
  #     elsif engagement >= 0.1
  #       score += 40
  #     end
  #   end
  end

end
