class AddUserIdToFight < ActiveRecord::Migration[5.0]
  def change
    add_column :fights, :user_id, :integer
  end
end
