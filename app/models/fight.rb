class Fight < ApplicationRecord

  belongs_to :challenger, :class_name => 'InstaUser', :foreign_key => :challenger_id
  belongs_to :opponent, :class_name => 'InstaUser', :foreign_key => :opponent_id
  has_many :insta_users





end
