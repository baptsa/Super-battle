class CreateFights < ActiveRecord::Migration[5.0]
  def change
    create_table :fights do |t|
      t.integer :result
      t.integer :challenger_id
      t.integer :opponent_id

      t.timestamps
    end
  end
end
