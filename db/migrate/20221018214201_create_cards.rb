class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :price
      t.integer :grade
      t.string :number
      t.string :signed
      t.string :jersey
      t.integer :player_id 
    end
  end
end
