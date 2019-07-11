class AddPlayersStatusToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :no_of_players, :integer
    add_column :games, :status, :string
    add_reference :games, :player, index: true
  end
end
