class RemoveResultInFightAndAddScores < ActiveRecord::Migration[5.0]
  def change
    remove_column :fights, :result, :integer
    add_column :fights, :follower_score_challenger, :integer
    add_column :fights, :follower_score_opponent, :integer
    add_column :fights, :media_score_challenger, :integer
    add_column :fights, :media_score_opponent, :integer
    add_column :fights, :engagement_score_challenger, :integer
    add_column :fights, :engagement_score_opponent, :integer
    add_column :fights, :final_score_challenger, :integer
    add_column :fights, :final_score_opponent, :integer
  end
end

