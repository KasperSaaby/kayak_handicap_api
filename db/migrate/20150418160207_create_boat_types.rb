class CreateBoatTypes < ActiveRecord::Migration
  def change
    create_table :boat_types do |t|
      t.string :name
      t.integer :seats

      t.timestamps null: false
    end
  end
end
