class ChangeMediaTypeInInstaUsers < ActiveRecord::Migration[5.0]

  def change
    remove_column :insta_users, :media, :string
    add_column :insta_users, :media, :integer
  end


end
