require 'score_algorithm.rb'

class InstaUser < ApplicationRecord
  belongs_to :user
 # has_one :user, dependent: :destroy
  has_many :fights_as_competitor, class_name: "Fight", foreign_key: :opponent_id, dependent: :destroy
  has_many :fights_as_challenger, class_name: "Fight", foreign_key: :challenger_id, dependent: :destroy

  def fights
    fights_as_challenger + fights_as_competitor
  end
end









