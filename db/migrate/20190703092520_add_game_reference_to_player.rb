class AddGameReferenceToPlayer < ActiveRecord::Migration[5.2]
  def change
  	    add_reference :players, :game, index: true
  end
end
