class CreateInstaUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :insta_users do |t|
      t.string :username
      t.string :profile_picture
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :media
      t.integer :follow
      t.integer :followed_by
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
