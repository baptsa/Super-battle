class InstaUser < ApplicationRecord
  # belongs_to :user, optional: true

  # has_one :user, dependent: :destroy
  has_many :fights_as_competitor, class_name: "Fight", foreign_key: :opponent_id, dependent: :destroy
  has_many :fights_as_challenger, class_name: "Fight", foreign_key: :challenger_id, dependent: :destroy

  validates :username, uniqueness: true

  def fights
    fights_as_challenger + fights_as_competitor
  end
end









