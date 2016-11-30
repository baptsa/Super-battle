class AddEngagementToInstaUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :insta_users, :engagement, :integer
  end
end
