class InstaUser < ApplicationRecord
  # belongs_to :user
  has_many :fights_as_competitor, class_name: "Fight", foreign_key: :competitor_id
  has_many :fights_as_challenger, class_name: "Fight", foreign_key: :challenger_id

  def fights
    fights_as_challenger + fights_as_competitor
  end
end









