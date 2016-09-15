class RemovePlayerIdsFromGames < ActiveRecord::Migration[5.0]
  def up
  	remove_column :games, :player_one_id
  	remove_column :games, :player_two_id
  end

  def down
  	add_column :games, :player_one_id, :integer
  	add_column :games, :player_two_id, :integer
  end
end
