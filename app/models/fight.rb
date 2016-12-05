class Fight < ApplicationRecord

  belongs_to :challenger, :class_name => 'InstaUser', :foreign_key => :challenger_id
  belongs_to :opponent, :class_name => 'InstaUser', :foreign_key => :opponent_id
  belongs_to :user
  has_many :insta_users
  validates :challenger_id, presence: true, allow_blank: false
  validates :opponent_id, presence: true, allow_blank: false

  # require 'score_algorithm.rb'

end

