class AddReferenceToScore < ActiveRecord::Migration[5.2]
  def change
     add_reference :scores, :round, index: true
  	 add_reference :scores, :player, index: true

  end
end
