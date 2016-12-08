class Fight < ApplicationRecord
  belongs_to :challenger, :class_name => 'InstaUser', :foreign_key => :challenger_id
  belongs_to :opponent, :class_name => 'InstaUser', :foreign_key => :opponent_id

  belongs_to :user, optional: true

  has_many :insta_users

  validates :challenger_id, presence: true, allow_blank: false
  validates :opponent_id, presence: true, allow_blank: false

  # require 'score_algorithm.rb'
  def winner
    if final_score_challenger > final_score_opponent
      challenger
    elsif final_score_challenger < final_score_opponent
      opponent
    else
      nil
    end
  end

  def winner_name
    if self.final_score_challenger > self.final_score_opponent
      "@" + self.challenger.username.upcase + " WINS"
    elsif self.final_score_challenger < self.final_score_opponent
      "@" + self.opponent.username.upcase + " WINS"
    else
      return "IT'S A DRAW !!"
    end
  end
end

