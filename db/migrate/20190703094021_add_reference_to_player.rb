class AddReferenceToPlayer < ActiveRecord::Migration[5.2]
  def change
  	add_reference :players, :score, index: true
  end
end
